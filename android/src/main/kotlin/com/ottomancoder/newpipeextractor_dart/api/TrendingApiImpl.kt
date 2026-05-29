package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import org.schabi.newpipe.extractor.Extractor
import org.schabi.newpipe.extractor.ListExtractor
import org.schabi.newpipe.extractor.ServiceList.YouTube
import org.schabi.newpipe.extractor.localization.ContentCountry
import org.schabi.newpipe.extractor.localization.Localization
import java.util.Locale
import java.util.concurrent.ExecutorService

/**
 * Stateless trending / kiosk extraction. Pagination is driven by [PageDto]
 * tokens; extractors are recreated per call.
 */
class TrendingApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : TrendingApi {

    private fun <T : Extractor> T.localized(): T {
        forceLocalization(Localization(Locale.getDefault().language, Locale.getDefault().country))
        forceContentCountry(ContentCountry(Locale.getDefault().country.ifEmpty { "US" }))
        return this
    }

    private fun fetchKioskPage(kioskId: String): ListExtractor.InfoItemsPage<*> {
        val extractor = YouTube.kioskList.getExtractorById(kioskId, null).localized()
        extractor.fetchPage()
        return extractor.initialPage
    }

    override fun getTrendingVideos(callback: (Result<StreamListPageDto>) -> Unit) {
        executor.execute {
            try {
                val page: ListExtractor.InfoItemsPage<*> = try {
                    fetchKioskPage("Trending")
                } catch (_: Exception) {
                    // Trending tab broken in v0.26.2 — fallback to default kiosk.
                    try {
                        val ext = YouTube.kioskList.defaultKioskExtractor.localized()
                        ext.fetchPage()
                        ext.initialPage
                    } catch (_: Exception) {
                        // Last resort: first kiosk that works.
                        var result: ListExtractor.InfoItemsPage<*>? = null
                        for (kiosk in YouTube.kioskList.availableKiosks) {
                            try { result = fetchKioskPage(kiosk); break } catch (_: Exception) { continue }
                        }
                        result ?: throw Exception("No trending kiosk available")
                    }
                }
                val dto = ExtractorHelper.streamListPage(page)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getTrendingNextPage(page: PageDto, callback: (Result<StreamListPageDto>) -> Unit) {
        executor.execute {
            try {
                // Recreate a trending kiosk extractor (same resolution as getTrendingVideos);
                // the token carries the continuation, so getPage parses it directly.
                val extractor = try {
                    YouTube.kioskList.getExtractorById("Trending", null)
                } catch (_: Exception) {
                    YouTube.kioskList.defaultKioskExtractor
                }.localized()
                val itemsPage = extractor.getPage(ExtractorHelper.pageFromDto(page))
                val dto = ExtractorHelper.streamListPage(itemsPage)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun listKiosks(callback: (Result<List<String?>>) -> Unit) {
        executor.execute {
            try {
                handler.post { callback(Result.success(YouTube.kioskList.availableKiosks.toList())) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getKioskContent(kioskId: String, callback: (Result<StreamListPageDto>) -> Unit) {
        executor.execute {
            try {
                val dto = ExtractorHelper.streamListPage(fetchKioskPage(kioskId))
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getKioskNextPage(
        kioskId: String,
        page: PageDto,
        callback: (Result<StreamListPageDto>) -> Unit
    ) {
        executor.execute {
            try {
                val extractor = YouTube.kioskList.getExtractorById(kioskId, null).localized()
                val itemsPage = extractor.getPage(ExtractorHelper.pageFromDto(page))
                val dto = ExtractorHelper.streamListPage(itemsPage)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
