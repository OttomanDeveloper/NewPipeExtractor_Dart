package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.imagesToList
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapStreamInfoItem
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.tryOrNull
import org.schabi.newpipe.extractor.InfoItem
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.ServiceList.YouTube
import org.schabi.newpipe.extractor.channel.ChannelExtractor
import org.schabi.newpipe.extractor.channel.ChannelInfoItem
import org.schabi.newpipe.extractor.channel.tabs.ChannelTabExtractor
import org.schabi.newpipe.extractor.feed.FeedExtractor
import org.schabi.newpipe.extractor.playlist.PlaylistInfoItem
import org.schabi.newpipe.extractor.stream.StreamInfoItem
import java.util.concurrent.ExecutorService

class ChannelApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ChannelApi {

    private var channelExtractor: ChannelExtractor? = null
    private var feedExtractor: FeedExtractor? = null
    private var feedPage: ListExtractor.InfoItemsPage<StreamInfoItem>? = null

    private var tabExtractor: ChannelTabExtractor? = null
    private var tabPage: ListExtractor.InfoItemsPage<*>? = null

    override fun getChannelInfo(url: String, callback: (Result<ChannelDto>) -> Unit) {
        executor.execute {
            try {
                val extractor = YouTube.getChannelExtractor(url)
                extractor.fetchPage()
                channelExtractor = extractor

                val tabs = tryOrNull {
                    extractor.tabs.flatMap { tab ->
                        tab.contentFilters
                    }
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

    override fun getChannelUploads(url: String, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val chExtractor = YouTube.getChannelExtractor(url)
                chExtractor.fetchPage()
                channelExtractor = chExtractor

                val feed = YouTube.getFeedExtractor(chExtractor.url)
                    ?: throw Exception("Feed not available for this channel")
                feed.fetchPage()
                feedExtractor = feed

                val page = feed.initialPage
                feedPage = page

                val items = page.items.map { mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getChannelNextPage(callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val page = feedPage
                val feed = feedExtractor
                if (page != null && feed != null && page.hasNextPage()) {
                    val nextPage = feed.getPage(page.nextPage)
                    feedPage = nextPage
                    val items = nextPage.items.map { mapStreamInfoItem(it) }
                    handler.post { callback(Result.success(items)) }
                } else {
                    handler.post { callback(Result.success(emptyList())) }
                }
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
                val chExtractor = channelExtractor ?: run {
                    val ext = YouTube.getChannelExtractor(url)
                    ext.fetchPage()
                    channelExtractor = ext
                    ext
                }

                val tab = chExtractor.tabs.firstOrNull { linkHandler ->
                    linkHandler.contentFilters.contains(tabFilter)
                } ?: throw Exception("Tab '$tabFilter' not found")

                val tabExt = YouTube.getChannelTabExtractor(tab)
                tabExt.fetchPage()
                tabExtractor = tabExt

                val page = tabExt.initialPage
                tabPage = page

                val streams = mutableListOf<StreamInfoItemDto>()
                val playlists = mutableListOf<PlaylistInfoItemDto>()
                val channels = mutableListOf<ChannelInfoItemDto>()
                for (item in page.items) {
                    when (item.infoType) {
                        InfoItem.InfoType.STREAM -> streams.add(mapStreamInfoItem(item as StreamInfoItem))
                        InfoItem.InfoType.PLAYLIST -> playlists.add(ExtractorHelper.mapPlaylistInfoItem(item as PlaylistInfoItem))
                        InfoItem.InfoType.CHANNEL -> channels.add(ExtractorHelper.mapChannelInfoItem(item as ChannelInfoItem))
                        else -> {}
                    }
                }

                val result = TabPageDto(
                    streamItems = streams,
                    playlistItems = playlists,
                    channelItems = channels,
                    hasNextPage = page.hasNextPage()
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getChannelTabNextPage(callback: (Result<TabPageDto>) -> Unit) {
        executor.execute {
            try {
                val page = tabPage
                val tab = tabExtractor
                if (page != null && tab != null && page.hasNextPage()) {
                    val nextPage = tab.getPage(page.nextPage)
                    tabPage = nextPage

                    val streams = mutableListOf<StreamInfoItemDto>()
                    val playlists = mutableListOf<PlaylistInfoItemDto>()
                    val channels = mutableListOf<ChannelInfoItemDto>()
                    for (item in nextPage.items) {
                        when (item.infoType) {
                            InfoItem.InfoType.STREAM -> streams.add(mapStreamInfoItem(item as StreamInfoItem))
                            InfoItem.InfoType.PLAYLIST -> playlists.add(ExtractorHelper.mapPlaylistInfoItem(item as PlaylistInfoItem))
                            InfoItem.InfoType.CHANNEL -> channels.add(ExtractorHelper.mapChannelInfoItem(item as ChannelInfoItem))
                            else -> {}
                        }
                    }

                    val result = TabPageDto(
                        streamItems = streams,
                        playlistItems = playlists,
                        channelItems = channels,
                        hasNextPage = nextPage.hasNextPage()
                    )
                    handler.post { callback(Result.success(result)) }
                } else {
                    val empty = TabPageDto(streamItems = emptyList(), playlistItems = emptyList(), channelItems = emptyList(), hasNextPage = false)
                    handler.post { callback(Result.success(empty)) }
                }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
