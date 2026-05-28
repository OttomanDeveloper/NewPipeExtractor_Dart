package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.channel.ChannelExtractor
import org.schabi.newpipe.extractor.feed.FeedExtractor
import org.schabi.newpipe.extractor.stream.StreamInfoItem
import java.util.concurrent.ExecutorService

class ServiceChannelApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServiceChannelApi {

    private val extractors = mutableMapOf<Long, ChannelExtractor>()
    private val pages = mutableMapOf<Long, ListExtractor.InfoItemsPage<StreamInfoItem>>()
    private val feedExtractors = mutableMapOf<Long, FeedExtractor>()
    private val feedPages = mutableMapOf<Long, ListExtractor.InfoItemsPage<StreamInfoItem>>()

    override fun getChannelInfo(serviceId: Long, url: String, callback: (Result<ChannelDto>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val ext = service.getChannelExtractor(url)
                ext.fetchPage()
                extractors[serviceId] = ext
                val dto = ChannelDto(
                    id = try { ext.id } catch (_: Exception) { null },
                    name = try { ext.name } catch (_: Exception) { null },
                    url = try { ext.url } catch (_: Exception) { null },
                    avatars = try { ExtractorHelper.imagesToList(ext.avatars) } catch (_: Exception) { emptyList() },
                    banners = try { ExtractorHelper.imagesToList(ext.banners) } catch (_: Exception) { emptyList() },
                    description = try { ext.description } catch (_: Exception) { null },
                    feedUrl = try { ext.feedUrl } catch (_: Exception) { null },
                    subscriberCount = try { ext.subscriberCount } catch (_: Exception) { null },
                    isVerified = try { ext.isVerified } catch (_: Exception) { false },
                    tabs = try { ext.tabs.map { it.contentFilters.firstOrNull() ?: "unknown" } } catch (_: Exception) { emptyList() }
                )
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getChannelContent(serviceId: Long, url: String, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val feedExt = service.getFeedExtractor(url)
                    ?: throw Exception("Feed not available for this channel")
                feedExt.fetchPage()
                val page = feedExt.initialPage
                feedExtractors[serviceId] = feedExt
                feedPages[serviceId] = page
                val items = page.items.map { ExtractorHelper.mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getChannelContentNextPage(serviceId: Long, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val feedExt = feedExtractors[serviceId]
                val page = feedPages[serviceId]
                if (feedExt != null && page?.hasNextPage() == true) {
                    val nextPage = feedExt.getPage(page.nextPage)
                    feedPages[serviceId] = nextPage
                    val items = nextPage.items.map { ExtractorHelper.mapStreamInfoItem(it) }
                    handler.post { callback(Result.success(items)) }
                } else {
                    handler.post { callback(Result.success(emptyList())) }
                }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
