package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.imagesToList
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.tryOrNull
import org.schabi.newpipe.extractor.ServiceList.YouTube
import java.util.concurrent.ExecutorService

/**
 * Stateless playlist extraction. Stream pagination is driven by [PageDto]
 * tokens passed back from Dart.
 */
class PlaylistApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : PlaylistApi {

    override fun getPlaylistDetails(url: String, callback: (Result<PlaylistDto>) -> Unit) {
        executor.execute {
            try {
                val ext = YouTube.getPlaylistExtractor(url)
                ext.fetchPage()

                val result = PlaylistDto(
                    id = tryOrNull { ext.id },
                    name = tryOrNull { ext.name },
                    url = tryOrNull { ext.url },
                    uploaderName = tryOrNull { ext.uploaderName },
                    uploaderAvatars = tryOrNull { imagesToList(ext.uploaderAvatars) },
                    uploaderUrl = tryOrNull { ext.uploaderUrl },
                    banners = tryOrNull { imagesToList(ext.banners) },
                    thumbnails = tryOrNull { imagesToList(ext.thumbnails) },
                    streamCount = tryOrNull { ext.streamCount },
                    description = tryOrNull { ext.description?.content },
                    playlistType = tryOrNull { ext.playlistType?.name }
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getPlaylistStreams(url: String, callback: (Result<StreamListPageDto>) -> Unit) {
        executor.execute {
            try {
                val ext = YouTube.getPlaylistExtractor(url)
                ext.fetchPage()
                val dto = ExtractorHelper.streamListPage(ext.initialPage)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getPlaylistNextPage(
        url: String,
        page: PageDto,
        callback: (Result<StreamListPageDto>) -> Unit
    ) {
        executor.execute {
            try {
                // No fetchPage(): getPage(token) is self-contained (proven by Phase 0 spike).
                val ext = YouTube.getPlaylistExtractor(url)
                val itemsPage = ext.getPage(ExtractorHelper.pageFromDto(page))
                val dto = ExtractorHelper.streamListPage(itemsPage)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
