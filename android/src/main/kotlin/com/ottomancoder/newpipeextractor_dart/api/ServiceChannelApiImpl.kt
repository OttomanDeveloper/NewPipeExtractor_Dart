package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.channel.ChannelExtractor
import org.schabi.newpipe.extractor.stream.StreamInfoItem
import java.util.concurrent.ExecutorService

class ServiceChannelApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServiceChannelApi {

    private val extractors = mutableMapOf<Long, ChannelExtractor>()
    private val pages = mutableMapOf<Long, ListExtractor.InfoItemsPage<StreamInfoItem>>()

    override fun getChannelInfo(serviceId: Long, url: String, callback: (Result<ChannelDto>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val ext = service.getChannelExtractor(url)
                ext.fetchPage()
                extractors[serviceId] = ext
                val dto = ChannelDto(
                    id = ext.id,
                    name = ext.name,
                    url = ext.url,
                    avatars = ExtractorHelper.imagesToList(ext.avatars),
                    banners = ExtractorHelper.imagesToList(ext.banners),
                    description = ext.description,
                    feedUrl = try { ext.feedUrl } catch (_: Exception) { null },
                    subscriberCount = ext.subscriberCount,
                    isVerified = try { ext.isVerified } catch (_: Exception) { false },
                    tabs = try { ext.tabs.map { it.contentFilters.firstOrNull() ?: "unknown" } } catch (_: Exception) { emptyList() }
                )
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getChannelContent(serviceId: Long, url: String, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val feedExt = service.getFeedExtractor(url)
                feedExt.fetchPage()
                val page = feedExt.initialPage
                val items = page.items.map { ExtractorHelper.mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getChannelContentNextPage(serviceId: Long, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            // Generic channel content pagination is limited without storing feed extractor state
            // Return empty for now — use YouTube-specific ChannelApi for full pagination
            handler.post { callback(Result.success(emptyList())) }
        }
    }
}
