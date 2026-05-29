package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.imagesToList
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.tryOrNull
import org.schabi.newpipe.extractor.ServiceList.YouTube
import java.util.concurrent.ExecutorService

/**
 * Stateless channel extraction. Uploads and tab pagination are driven by
 * [PageDto] tokens; the extractor is recreated per call so multiple channel
 * lists never share a cursor.
 */
class ChannelApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ChannelApi {

    override fun getChannelInfo(url: String, callback: (Result<ChannelDto>) -> Unit) {
        executor.execute {
            try {
                val extractor = YouTube.getChannelExtractor(url)
                extractor.fetchPage()

                val tabs = tryOrNull {
                    extractor.tabs.flatMap { tab -> tab.contentFilters }
                }

                val result = ChannelDto(
                    id = tryOrNull { extractor.id },
                    name = tryOrNull { extractor.name },
                    url = tryOrNull { extractor.url },
                    avatars = tryOrNull { imagesToList(extractor.avatars) },
                    banners = tryOrNull { imagesToList(extractor.banners) },
                    description = tryOrNull { extractor.description },
                    feedUrl = tryOrNull { extractor.feedUrl },
                    subscriberCount = tryOrNull { extractor.subscriberCount },
                    isVerified = tryOrNull { extractor.isVerified },
                    tabs = tabs
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getChannelUploads(url: String, callback: (Result<StreamListPageDto>) -> Unit) {
        executor.execute {
            try {
                val chExtractor = YouTube.getChannelExtractor(url)
                chExtractor.fetchPage()
                val feed = YouTube.getFeedExtractor(chExtractor.url)
                    ?: throw Exception("Feed not available for this channel")
                feed.fetchPage()
                val dto = ExtractorHelper.streamListPage(feed.initialPage)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getChannelNextPage(
        url: String,
        page: PageDto,
        callback: (Result<StreamListPageDto>) -> Unit
    ) {
        executor.execute {
            try {
                val chExtractor = YouTube.getChannelExtractor(url)
                chExtractor.fetchPage()
                val feed = YouTube.getFeedExtractor(chExtractor.url)
                    ?: throw Exception("Feed not available for this channel")
                val itemsPage = feed.getPage(ExtractorHelper.pageFromDto(page))
                val dto = ExtractorHelper.streamListPage(itemsPage)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getChannelTabContent(
        url: String,
        tabFilter: String,
        callback: (Result<TabPageDto>) -> Unit
    ) {
        executor.execute {
            try {
                val chExtractor = YouTube.getChannelExtractor(url)
                chExtractor.fetchPage()
                val tab = chExtractor.tabs.firstOrNull { linkHandler ->
                    linkHandler.contentFilters.contains(tabFilter)
                } ?: throw Exception("Tab '$tabFilter' not found")

                val tabExt = YouTube.getChannelTabExtractor(tab)
                tabExt.fetchPage()
                val page = tabExt.initialPage
                val result = ExtractorHelper.categorizeTabItems(
                    page.items, page.hasNextPage(), ExtractorHelper.mapPage(page.nextPage)
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getChannelTabNextPage(
        url: String,
        tabFilter: String,
        page: PageDto,
        callback: (Result<TabPageDto>) -> Unit
    ) {
        executor.execute {
            try {
                val chExtractor = YouTube.getChannelExtractor(url)
                chExtractor.fetchPage()
                val tab = chExtractor.tabs.firstOrNull { linkHandler ->
                    linkHandler.contentFilters.contains(tabFilter)
                } ?: throw Exception("Tab '$tabFilter' not found")

                val tabExt = YouTube.getChannelTabExtractor(tab)
                val itemsPage = tabExt.getPage(ExtractorHelper.pageFromDto(page))
                val result = ExtractorHelper.categorizeTabItems(
                    itemsPage.items, itemsPage.hasNextPage(), ExtractorHelper.mapPage(itemsPage.nextPage)
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
