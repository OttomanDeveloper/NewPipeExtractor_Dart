package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapStreamInfoItem
import org.schabi.newpipe.extractor.ServiceList.YouTube
import org.schabi.newpipe.extractor.stream.StreamInfoItem
import org.schabi.newpipe.extractor.localization.ContentCountry
import org.schabi.newpipe.extractor.localization.Localization
import java.util.Locale
import java.util.concurrent.ExecutorService

class TrendingApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : TrendingApi {

    private fun fetchKiosk(kioskId: String): List<StreamInfoItemDto?> {
        val extractor = YouTube.kioskList.getExtractorById(kioskId, null)
        extractor.forceLocalization(Localization(Locale.getDefault().language, Locale.getDefault().country))
        extractor.forceContentCountry(ContentCountry(Locale.getDefault().country.ifEmpty { "US" }))
        extractor.fetchPage()
        return extractor.initialPage.items.filterIsInstance<StreamInfoItem>().map { mapStreamInfoItem(it) }
    }

    override fun getTrendingVideos(callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                // Try "Trending" first
                val items = try {
                    fetchKiosk("Trending")
                } catch (_: Exception) {
                    // Trending tab broken in v0.26.2 — fallback to default kiosk
                    try {
                        val defaultExtractor = YouTube.kioskList.defaultKioskExtractor
                        defaultExtractor.forceLocalization(Localization(Locale.getDefault().language, Locale.getDefault().country))
                        defaultExtractor.forceContentCountry(ContentCountry(Locale.getDefault().country.ifEmpty { "US" }))
                        defaultExtractor.fetchPage()
                        defaultExtractor.initialPage.items.filterIsInstance<StreamInfoItem>().map { mapStreamInfoItem(it) }
                    } catch (_: Exception) {
                        // Last resort: try each available kiosk
                        var result: List<StreamInfoItemDto?>? = null
                        for (kiosk in YouTube.kioskList.availableKiosks) {
                            try {
                                result = fetchKiosk(kiosk)
                                break
                            } catch (_: Exception) { continue }
                        }
                        result ?: emptyList()
                    }
                }
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
                val items = fetchKiosk(kioskId)
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
