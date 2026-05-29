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
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit

class NewpipeextractorDartPlugin : FlutterPlugin {

    // A bounded thread pool so independent extractor calls (search, suggestions,
    // video info, ...) run concurrently without the pool growing without limit.
    // A single-thread executor caused search requests to starve behind the
    // per-keystroke suggestion requests, leaving the UI stuck on an infinite
    // spinner; a cached pool fixed that but had no maximum size, so a burst of
    // requests (e.g. fast typing) could spawn an unbounded number of threads.
    //
    // This caps live threads at MAX_THREADS. Overflow waits in the queue as
    // lightweight Runnables instead of new threads. OkHttp's callTimeout (see
    // DownloaderImpl) guarantees every task finishes within ~45s, so the queue
    // always drains; allowCoreThreadTimeOut reclaims idle threads after 60s.
    private val executor: ExecutorService = run {
        val maxThreads = (Runtime.getRuntime().availableProcessors() * 2).coerceIn(4, 16)
        ThreadPoolExecutor(
            maxThreads, maxThreads,
            60L, TimeUnit.SECONDS,
            LinkedBlockingQueue()
        ).apply { allowCoreThreadTimeOut(true) }
    }
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
            ContentCountry(Locale.getDefault().country.ifEmpty { "US" })
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
        LocalizationApi.setUp(messenger, LocalizationApiImpl(executor, handler))
        ServiceApi.setUp(messenger, ServiceApiImpl(executor, handler))
        ServiceStreamApi.setUp(messenger, ServiceStreamApiImpl(executor, handler))
        ServiceSearchApi.setUp(messenger, ServiceSearchApiImpl(executor, handler))
        ServiceChannelApi.setUp(messenger, ServiceChannelApiImpl(executor, handler))
        ServicePlaylistApi.setUp(messenger, ServicePlaylistApiImpl(executor, handler))
        ServiceKioskApi.setUp(messenger, ServiceKioskApiImpl(executor, handler))
        ServiceCommentsApi.setUp(messenger, ServiceCommentsApiImpl(executor, handler))
        SubscriptionApi.setUp(messenger, SubscriptionApiImpl(executor, handler))
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
        LocalizationApi.setUp(messenger, null)
        ServiceApi.setUp(messenger, null)
        ServiceStreamApi.setUp(messenger, null)
        ServiceSearchApi.setUp(messenger, null)
        ServiceChannelApi.setUp(messenger, null)
        ServicePlaylistApi.setUp(messenger, null)
        ServiceKioskApi.setUp(messenger, null)
        ServiceCommentsApi.setUp(messenger, null)
        SubscriptionApi.setUp(messenger, null)
        executor.shutdown()
    }
}
