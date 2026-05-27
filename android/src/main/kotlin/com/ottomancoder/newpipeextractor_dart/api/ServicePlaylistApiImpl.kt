package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.playlist.PlaylistExtractor
import org.schabi.newpipe.extractor.stream.StreamInfoItem
import java.util.concurrent.ExecutorService

class ServicePlaylistApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServicePlaylistApi {

    private val extractors = mutableMapOf<Long, PlaylistExtractor>()
    private val pages = mutableMapOf<Long, ListExtractor.InfoItemsPage<StreamInfoItem>>()

    override fun getPlaylistInfo(serviceId: Long, url: String, callback: (Result<PlaylistDto>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val ext = service.getPlaylistExtractor(url)
                ext.fetchPage()
                extractors[serviceId] = ext
                val dto = PlaylistDto(
                    id = ext.id,
                    name = ext.name,
                    url = ext.url,
                    uploaderName = try { ext.uploaderName } catch (_: Exception) { "Unknown" },
                    uploaderAvatars = try { ExtractorHelper.imagesToList(ext.uploaderAvatars) } catch (_: Exception) { emptyList() },
                    uploaderUrl = try { ext.uploaderUrl } catch (_: Exception) { null },
                    banners = ExtractorHelper.imagesToList(ext.banners),
                    thumbnails = ExtractorHelper.imagesToList(ext.thumbnails),
                    streamCount = ext.streamCount,
                    description = try { ext.description?.content } catch (_: Exception) { null },
                    playlistType = try { ext.playlistType?.name } catch (_: Exception) { null }
                )
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getPlaylistContent(serviceId: Long, url: String, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val ext = service.getPlaylistExtractor(url)
                ext.fetchPage()
                extractors[serviceId] = ext
                val page = ext.initialPage
                pages[serviceId] = page
                val items = page.items.map { ExtractorHelper.mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getPlaylistContentNextPage(serviceId: Long, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val ext = extractors[serviceId]
                val page = pages[serviceId]
                if (ext != null && page?.hasNextPage() == true) {
                    val nextPage = ext.getPage(page.nextPage)
                    pages[serviceId] = nextPage
                    val items = nextPage.items.map { ExtractorHelper.mapStreamInfoItem(it) }
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
