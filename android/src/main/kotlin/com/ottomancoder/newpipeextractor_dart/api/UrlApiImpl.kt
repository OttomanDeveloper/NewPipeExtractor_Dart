package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper
import com.ottomancoder.newpipeextractor_dart.UrlApi
import org.schabi.newpipe.extractor.services.youtube.linkHandler.YoutubeChannelLinkHandlerFactory
import org.schabi.newpipe.extractor.services.youtube.linkHandler.YoutubePlaylistLinkHandlerFactory
import org.schabi.newpipe.extractor.services.youtube.linkHandler.YoutubeStreamLinkHandlerFactory
import java.util.concurrent.ExecutorService

class UrlApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : UrlApi {

    override fun getIdFromStreamUrl(url: String, callback: (Result<String?>) -> Unit) {
        executor.execute {
            try {
                val id = ExtractorHelper.getIdFromStreamUrl(url)
                handler.post { callback(Result.success(id)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getIdFromPlaylistUrl(url: String, callback: (Result<String?>) -> Unit) {
        executor.execute {
            try {
                val id = ExtractorHelper.getIdFromPlaylistUrl(url)
                handler.post { callback(Result.success(id)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getIdFromChannelUrl(url: String, callback: (Result<String?>) -> Unit) {
        executor.execute {
            try {
                val id = ExtractorHelper.getIdFromChannelUrl(url)
                handler.post { callback(Result.success(id)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun isValidStreamUrl(url: String, callback: (Result<Boolean>) -> Unit) {
        executor.execute {
            try {
                YoutubeStreamLinkHandlerFactory.getInstance().fromUrl(url)
                handler.post { callback(Result.success(true)) }
            } catch (_: Exception) {
                handler.post { callback(Result.success(false)) }
            }
        }
    }

    override fun isValidPlaylistUrl(url: String, callback: (Result<Boolean>) -> Unit) {
        executor.execute {
            try {
                YoutubePlaylistLinkHandlerFactory.getInstance().fromUrl(url)
                handler.post { callback(Result.success(true)) }
            } catch (_: Exception) {
                handler.post { callback(Result.success(false)) }
            }
        }
    }

    override fun isValidChannelUrl(url: String, callback: (Result<Boolean>) -> Unit) {
        executor.execute {
            try {
                YoutubeChannelLinkHandlerFactory.getInstance().fromUrl(url)
                handler.post { callback(Result.success(true)) }
            } catch (_: Exception) {
                handler.post { callback(Result.success(false)) }
            }
        }
    }
}
