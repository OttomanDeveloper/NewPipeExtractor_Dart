package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper
import com.ottomancoder.newpipeextractor_dart.UrlApi
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
}
