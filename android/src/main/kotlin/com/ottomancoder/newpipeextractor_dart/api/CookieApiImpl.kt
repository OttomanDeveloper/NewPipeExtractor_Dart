package com.ottomancoder.newpipeextractor_dart.api

import android.content.Context
import android.os.Handler
import android.preference.PreferenceManager
import android.webkit.CookieManager
import com.ottomancoder.newpipeextractor_dart.CookieApi
import com.ottomancoder.newpipeextractor_dart.downloader.DownloaderImpl
import java.net.URLDecoder
import java.util.concurrent.ExecutorService

class CookieApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler,
    private val context: Context
) : CookieApi {

    companion object {
        const val PREFS_COOKIES_KEY = "prefs_cookies_key"
    }

    override fun setCookie(cookie: String, callback: (Result<Unit>) -> Unit) {
        executor.execute {
            try {
                DownloaderImpl.getInstance().setCookie(cookie)
                val preferences = PreferenceManager.getDefaultSharedPreferences(context)
                preferences.edit().putString(PREFS_COOKIES_KEY, cookie).commit()
                handler.post { callback(Result.success(Unit)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getCookieByUrl(url: String, callback: (Result<String?>) -> Unit) {
        executor.execute {
            try {
                val cookie = CookieManager.getInstance().getCookie(url)
                handler.post { callback(Result.success(cookie)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun decodeCookie(cookie: String, callback: (Result<String?>) -> Unit) {
        executor.execute {
            try {
                val decoded = URLDecoder.decode(cookie, "UTF-8")
                handler.post { callback(Result.success(decoded)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }
}
