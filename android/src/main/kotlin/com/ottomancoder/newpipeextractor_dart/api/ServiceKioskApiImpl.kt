package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.localization.Localization
import org.schabi.newpipe.extractor.stream.StreamInfoItem
import java.util.Locale
import java.util.concurrent.ExecutorService

class ServiceKioskApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServiceKioskApi {

    override fun listServiceKiosks(serviceId: Long, callback: (Result<List<String?>>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val kiosks = service.kioskList.availableKiosks.toList()
                handler.post { callback(Result.success(kiosks)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getServiceKioskContent(serviceId: Long, kioskId: String, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val extractor = service.kioskList.getExtractorById(kioskId, null)
                extractor.forceLocalization(Localization(Locale.getDefault().language, Locale.getDefault().country))
                extractor.forceContentCountry(org.schabi.newpipe.extractor.localization.ContentCountry(Locale.getDefault().country.ifEmpty { "US" }))
                extractor.fetchPage()
                val items = extractor.initialPage.items.filterIsInstance<StreamInfoItem>().map { ExtractorHelper.mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                try {
                    val service = NewPipe.getService(serviceId.toInt())
                    val extractor = service.kioskList.getExtractorById(kioskId, null)
                    extractor.forceLocalization(Localization("en", "US"))
                    extractor.forceContentCountry(org.schabi.newpipe.extractor.localization.ContentCountry("US"))
                    extractor.fetchPage()
                    val items = extractor.initialPage.items.filterIsInstance<StreamInfoItem>().map { ExtractorHelper.mapStreamInfoItem(it) }
                    handler.post { callback(Result.success(items)) }
                } catch (fallbackError: Exception) {
                    handler.post { callback(e.toFlutterResult()) }
                }
            }
        }
    }
}
