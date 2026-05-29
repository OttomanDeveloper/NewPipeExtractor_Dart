package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapComment
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.comments.CommentsExtractor
import org.schabi.newpipe.extractor.comments.CommentsInfoItem
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.ExecutorService

/**
 * Comments for any service that supports them. Mirrors [CommentsApiImpl] but is keyed
 * by serviceId so multiple services can paginate independently. Reply expansion is not
 * exposed generically (the YouTube path uses an index-based reply model that does not
 * generalize across services).
 */
class ServiceCommentsApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServiceCommentsApi {

    private val extractors = ConcurrentHashMap<Long, CommentsExtractor>()
    private val pages = ConcurrentHashMap<Long, ListExtractor.InfoItemsPage<CommentsInfoItem>>()

    override fun getComments(serviceId: Long, url: String, callback: (Result<CommentsPageDto>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val ext = service.getCommentsExtractor(url)
                    ?: throw Exception("Comments not supported for service $serviceId")
                ext.fetchPage()
                extractors[serviceId] = ext

                val page = ext.initialPage
                pages[serviceId] = page

                val result = CommentsPageDto(
                    comments = page.items.map { mapComment(it) },
                    hasNextPage = page.hasNextPage()
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getNextCommentsPage(serviceId: Long, callback: (Result<CommentsPageDto>) -> Unit) {
        executor.execute {
            try {
                val ext = extractors[serviceId]
                val page = pages[serviceId]
                if (ext != null && page != null && page.hasNextPage()) {
                    val nextPage = ext.getPage(page.nextPage)
                    pages[serviceId] = nextPage
                    val result = CommentsPageDto(
                        comments = nextPage.items.map { mapComment(it) },
                        hasNextPage = nextPage.hasNextPage()
                    )
                    handler.post { callback(Result.success(result)) }
                } else {
                    handler.post { callback(Result.success(CommentsPageDto(comments = emptyList(), hasNextPage = false))) }
                }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
