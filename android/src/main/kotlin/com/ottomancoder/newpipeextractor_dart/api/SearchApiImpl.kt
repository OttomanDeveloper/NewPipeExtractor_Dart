package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.categorizeInfoItems
import org.schabi.newpipe.extractor.InfoItem
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.ServiceList.YouTube
import org.schabi.newpipe.extractor.search.SearchExtractor
import org.schabi.newpipe.extractor.services.youtube.linkHandler.YoutubeSearchQueryHandlerFactory
import java.util.concurrent.ExecutorService

class SearchApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : SearchApi {

    private var searchExtractor: SearchExtractor? = null
    private var searchPage: ListExtractor.InfoItemsPage<InfoItem>? = null

    private var musicExtractor: SearchExtractor? = null
    private var musicPage: ListExtractor.InfoItemsPage<InfoItem>? = null

    override fun searchYoutube(
        query: String,
        filters: List<String?>,
        callback: (Result<SearchResultDto>) -> Unit
    ) {
        executor.execute {
            try {
                val nonNullFilters = filters.filterNotNull()
                val extractor = YouTube.getSearchExtractor(query, nonNullFilters, "")
                extractor.fetchPage()
                val page = extractor.initialPage
                searchExtractor = extractor
                searchPage = page
                val result = categorizeInfoItems(page.items)
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getNextPage(callback: (Result<SearchResultDto>) -> Unit) {
        executor.execute {
            try {
                val page = searchPage
                val extractor = searchExtractor
                if (page != null && extractor != null && page.hasNextPage()) {
                    val nextPage = extractor.getPage(page.nextPage)
                    searchPage = nextPage
                    val result = categorizeInfoItems(nextPage.items)
                    handler.post { callback(Result.success(result)) }
                } else {
                    val empty = SearchResultDto(
                        videos = emptyList(),
                        playlists = emptyList(),
                        channels = emptyList()
                    )
                    handler.post { callback(Result.success(empty)) }
                }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun searchYoutubeMusic(
        query: String,
        filters: List<String?>,
        callback: (Result<SearchResultDto>) -> Unit
    ) {
        executor.execute {
            try {
                val contentFilter = mutableListOf(YoutubeSearchQueryHandlerFactory.MUSIC_SONGS)
                contentFilter.addAll(filters.filterNotNull())
                val extractor = YouTube.getSearchExtractor(query, contentFilter, "")
                extractor.fetchPage()
                val page = extractor.initialPage
                musicExtractor = extractor
                musicPage = page
                val result = categorizeInfoItems(page.items)
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getNextMusicPage(callback: (Result<SearchResultDto>) -> Unit) {
        executor.execute {
            try {
                val page = musicPage
                val extractor = musicExtractor
                if (page != null && extractor != null && page.hasNextPage()) {
                    val nextPage = extractor.getPage(page.nextPage)
                    musicPage = nextPage
                    val result = categorizeInfoItems(nextPage.items)
                    handler.post { callback(Result.success(result)) }
                } else {
                    val empty = SearchResultDto(
                        videos = emptyList(),
                        playlists = emptyList(),
                        channels = emptyList()
                    )
                    handler.post { callback(Result.success(empty)) }
                }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getSearchSuggestions(query: String, callback: (Result<List<String?>>) -> Unit) {
        executor.execute {
            try {
                val suggestions = YouTube.suggestionExtractor.suggestionList(query)
                handler.post { callback(Result.success(suggestions)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
