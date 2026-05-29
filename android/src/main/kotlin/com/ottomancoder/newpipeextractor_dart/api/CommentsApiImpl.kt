package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapComment
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.tryOrNull
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.Page
import org.schabi.newpipe.extractor.ServiceList.YouTube
import org.schabi.newpipe.extractor.comments.CommentsExtractor
import org.schabi.newpipe.extractor.comments.CommentsInfoItem
import java.util.concurrent.ExecutorService

class CommentsApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : CommentsApi {

    private var extractor: CommentsExtractor? = null
    private var currentPage: ListExtractor.InfoItemsPage<CommentsInfoItem>? = null
    private val replyPages: MutableList<Page?> = mutableListOf()

    override fun getComments(url: String, callback: (Result<CommentsPageDto>) -> Unit) {
        executor.execute {
            try {
                val ext = YouTube.getCommentsExtractor(url)
                ext.fetchPage()
                extractor = ext

                val page = ext.initialPage
                currentPage = page
                replyPages.clear()

                val comments = page.items.map { comment ->
                    replyPages.add(tryOrNull { comment.replies })
                    mapComment(comment)
                }
                val result = CommentsPageDto(
                    comments = comments,
                    hasNextPage = page.hasNextPage()
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getNextCommentsPage(callback: (Result<CommentsPageDto>) -> Unit) {
        executor.execute {
            try {
                val page = currentPage
                val ext = extractor
                if (page != null && ext != null && page.hasNextPage()) {
                    val nextPage = ext.getPage(page.nextPage)
                    currentPage = nextPage
                    val comments = nextPage.items.map { comment ->
                        replyPages.add(tryOrNull { comment.replies })
                        mapComment(comment)
                    }
                    val result = CommentsPageDto(
                        comments = comments,
                        hasNextPage = nextPage.hasNextPage()
                    )
                    handler.post { callback(Result.success(result)) }
                } else {
                    val empty = CommentsPageDto(comments = emptyList(), hasNextPage = false)
                    handler.post { callback(Result.success(empty)) }
                }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getCommentReplies(commentIndex: Long, callback: (Result<CommentsPageDto>) -> Unit) {
        executor.execute {
            try {
                val ext = extractor
                    ?: throw IllegalStateException("Comments not loaded. Call getComments first.")
                val index = commentIndex.toInt()
                if (index < 0 || index >= replyPages.size) {
                    throw IndexOutOfBoundsException("Comment index $index out of range (0..${replyPages.size - 1})")
                }
                val replyPage = replyPages[index]
                    ?: throw IllegalStateException("No replies available for comment at index $index")

                val page = ext.getPage(replyPage)
                val comments = page.items.map { mapComment(it) }
                val result = CommentsPageDto(
                    comments = comments,
                    hasNextPage = page.hasNextPage()
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
