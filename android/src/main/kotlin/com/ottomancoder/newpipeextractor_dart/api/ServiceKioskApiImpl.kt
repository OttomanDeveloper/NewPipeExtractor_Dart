package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.localization.Localization
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
                val kiosks = service.kioskList.availableKiosks
                handler.post { callback(Result.success(kiosks)) }
            } catch (e: Exception) {
                handler.post { callback(Result.success(emptyList())) }
            }
        }
    }

    override fun getServiceKioskContent(serviceId: Long, kioskId: String, callback: (Result<List<StreamInfoItemDto?>>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val extractor = service.kioskList.getExtractorById(kioskId, null)
                extractor.forceLocalization(Localization.fromLocale(Locale.getDefault()))
                extractor.fetchPage()
                val items = extractor.initialPage.items.map { ExtractorHelper.mapStreamInfoItem(it) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }
}
