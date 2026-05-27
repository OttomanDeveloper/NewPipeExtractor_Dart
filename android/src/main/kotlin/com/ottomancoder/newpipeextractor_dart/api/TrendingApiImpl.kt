package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapStreamInfoItem
import org.schabi.newpipe.extractor.ServiceList.YouTube
import org.schabi.newpipe.extractor.localization.Localization
import java.util.Locale
import java.util.concurrent.ExecutorService

class TrendingApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : TrendingApi {

    override fun getTrendingVideos(callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val extractor = YouTube.kioskList.getExtractorById("Trending", null)
                extractor.forceLocalization(Localization.fromLocale(Locale.getDefault()))
                extractor.fetchPage()
                val page = extractor.initialPage
                val items = page.items.map { mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun listKiosks(callback: (Result<List<String?>>) -> Unit) {
        executor.execute {
            try {
                val kiosks = YouTube.kioskList.availableKiosks
                handler.post { callback(Result.success(kiosks.toList())) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getKioskContent(kioskId: String, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val extractor = YouTube.kioskList.getExtractorById(kioskId, null)
                extractor.forceLocalization(Localization.fromLocale(Locale.getDefault()))
                extractor.fetchPage()
                val items = extractor.initialPage.items.map { mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
