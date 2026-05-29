package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.categorizeInfoItems
import org.schabi.newpipe.extractor.ServiceList.YouTube
import org.schabi.newpipe.extractor.services.youtube.linkHandler.YoutubeSearchQueryHandlerFactory
import java.util.concurrent.ExecutorService

/**
 * Stateless search. Pagination is driven by [PageDto] tokens passed back from
 * Dart, so each list owns its own cursor -- no shared mutable extractor state.
 */
class SearchApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : SearchApi {

    override fun searchYoutube(
        query: String,
        filters: List<String?>,
        callback: (Result<SearchResultDto>) -> Unit
    ) {
        executor.execute {
            try {
                val extractor = YouTube.getSearchExtractor(query, filters.filterNotNull(), "")
                extractor.fetchPage()
                val page = extractor.initialPage
                val result = categorizeInfoItems(page.items)
                    .copy(nextPage = ExtractorHelper.mapPage(page.nextPage))
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun searchNextPage(
        query: String,
        filters: List<String?>,
        page: PageDto,
        callback: (Result<SearchResultDto>) -> Unit
    ) {
        executor.execute {
            try {
                val extractor = YouTube.getSearchExtractor(query, filters.filterNotNull(), "")
                val itemsPage = extractor.getPage(ExtractorHelper.pageFromDto(page))
                val result = categorizeInfoItems(itemsPage.items)
                    .copy(nextPage = ExtractorHelper.mapPage(itemsPage.nextPage))
                handler.post { callback(Result.success(result)) }
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
                val result = categorizeInfoItems(page.items)
                    .copy(nextPage = ExtractorHelper.mapPage(page.nextPage))
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun searchMusicNextPage(
        query: String,
        filters: List<String?>,
        page: PageDto,
        callback: (Result<SearchResultDto>) -> Unit
    ) {
        executor.execute {
            try {
                val contentFilter = mutableListOf(YoutubeSearchQueryHandlerFactory.MUSIC_SONGS)
                contentFilter.addAll(filters.filterNotNull())
                val extractor = YouTube.getSearchExtractor(query, contentFilter, "")
                val itemsPage = extractor.getPage(ExtractorHelper.pageFromDto(page))
                val result = categorizeInfoItems(itemsPage.items)
                    .copy(nextPage = ExtractorHelper.mapPage(itemsPage.nextPage))
                handler.post { callback(Result.success(result)) }
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
