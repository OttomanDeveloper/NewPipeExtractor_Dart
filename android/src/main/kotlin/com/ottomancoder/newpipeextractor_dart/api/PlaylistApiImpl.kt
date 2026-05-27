package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.imagesToList
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapStreamInfoItem
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.tryOrNull
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.ServiceList.YouTube
import org.schabi.newpipe.extractor.playlist.PlaylistExtractor
import org.schabi.newpipe.extractor.stream.StreamInfoItem
import java.util.concurrent.ExecutorService

class PlaylistApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : PlaylistApi {

    private var extractor: PlaylistExtractor? = null
    private var currentPage: ListExtractor.InfoItemsPage<StreamInfoItem>? = null

    override fun getPlaylistDetails(url: String, callback: (Result<PlaylistDto>) -> Unit) {
        executor.execute {
            try {
                val ext = YouTube.getPlaylistExtractor(url)
                ext.fetchPage()
                extractor = ext

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
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getPlaylistStreams(url: String, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val ext = YouTube.getPlaylistExtractor(url)
                ext.fetchPage()
                extractor = ext

                val page = ext.initialPage
                currentPage = page

                val items = page.items.map { mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getPlaylistNextPage(callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val page = currentPage
                val ext = extractor
                if (page != null && ext != null && page.hasNextPage()) {
                    val nextPage = ext.getPage(page.nextPage)
                    currentPage = nextPage
                    val items = nextPage.items.map { mapStreamInfoItem(it) }
                    handler.post { callback(Result.success(items)) }
                } else {
                    handler.post { callback(Result.success(emptyList())) }
                }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }
}
