package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import org.schabi.newpipe.extractor.InfoItem
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.search.SearchExtractor
import java.util.concurrent.ExecutorService

class ServiceSearchApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServiceSearchApi {

    private val extractors = mutableMapOf<Long, SearchExtractor>()
    private val pages = mutableMapOf<Long, ListExtractor.InfoItemsPage<InfoItem>>()

    override fun search(serviceId: Long, query: String, filters: List<String?>, callback: (Result<SearchResultDto>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val ext = service.getSearchExtractor(query, filters.filterNotNull(), "")
                ext.fetchPage()
                extractors[serviceId] = ext
                pages[serviceId] = ext.initialPage
                handler.post { callback(Result.success(ExtractorHelper.categorizeInfoItems(pages[serviceId]!!.items))) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun searchNextPage(serviceId: Long, callback: (Result<SearchResultDto>) -> Unit) {
        executor.execute {
            try {
                val ext = extractors[serviceId]
                val page = pages[serviceId]
                if (ext != null && page?.hasNextPage() == true) {
                    pages[serviceId] = ext.getPage(page.nextPage)
                    handler.post { callback(Result.success(ExtractorHelper.categorizeInfoItems(pages[serviceId]!!.items))) }
                } else {
                    handler.post { callback(Result.success(SearchResultDto(videos = emptyList(), playlists = emptyList(), channels = emptyList()))) }
                }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getSuggestions(serviceId: Long, query: String, callback: (Result<List<String?>>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val suggestions = service.suggestionExtractor.suggestionList(query)
                handler.post { callback(Result.success(suggestions)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }
}
