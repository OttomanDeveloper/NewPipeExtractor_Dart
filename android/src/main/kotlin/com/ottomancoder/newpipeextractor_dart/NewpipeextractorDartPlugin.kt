package com.ottomancoder.newpipeextractor_dart

import android.os.Handler
import android.os.Looper
import androidx.preference.PreferenceManager
import androidx.annotation.NonNull
import com.ottomancoder.newpipeextractor_dart.api.*
import com.ottomancoder.newpipeextractor_dart.downloader.DownloaderImpl
import io.flutter.embedding.engine.plugins.FlutterPlugin
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.localization.ContentCountry
import org.schabi.newpipe.extractor.localization.Localization
import java.util.Locale
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

class NewpipeextractorDartPlugin : FlutterPlugin {

    private val executor: ExecutorService = Executors.newSingleThreadExecutor()
    private val handler: Handler = Handler(Looper.getMainLooper())

    companion object {
        const val PREFS_COOKIES_KEY = "prefs_cookies_key"
    }

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        val context = binding.applicationContext
        val messenger = binding.binaryMessenger

        // Initialize NewPipe with DownloaderImpl
        NewPipe.init(
            DownloaderImpl.getInstance(),
            Localization.fromLocale(Locale.getDefault()),
            ContentCountry(Locale.getDefault().country)
        )

        // Restore saved cookies
        val preferences = PreferenceManager.getDefaultSharedPreferences(context)
        val cookie = preferences.getString(PREFS_COOKIES_KEY, null)
        if (!cookie.isNullOrEmpty()) {
            DownloaderImpl.getInstance().setCookie(cookie)
        }

        // Register all Pigeon API handlers
        VideoExtractorApi.setUp(messenger, VideoExtractorApiImpl(executor, handler))
        SearchApi.setUp(messenger, SearchApiImpl(executor, handler))
        ChannelApi.setUp(messenger, ChannelApiImpl(executor, handler))
        PlaylistApi.setUp(messenger, PlaylistApiImpl(executor, handler))
        CommentsApi.setUp(messenger, CommentsApiImpl(executor, handler))
        TrendingApi.setUp(messenger, TrendingApiImpl(executor, handler))
        UrlApi.setUp(messenger, UrlApiImpl(executor, handler))
        CookieApi.setUp(messenger, CookieApiImpl(executor, handler, context))
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        val messenger = binding.binaryMessenger
        VideoExtractorApi.setUp(messenger, null)
        SearchApi.setUp(messenger, null)
        ChannelApi.setUp(messenger, null)
        PlaylistApi.setUp(messenger, null)
        CommentsApi.setUp(messenger, null)
        TrendingApi.setUp(messenger, null)
        UrlApi.setUp(messenger, null)
        CookieApi.setUp(messenger, null)
    }
}
