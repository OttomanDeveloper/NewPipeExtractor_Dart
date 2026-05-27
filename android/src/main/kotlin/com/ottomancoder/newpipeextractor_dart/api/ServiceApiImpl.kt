package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import org.schabi.newpipe.extractor.NewPipe
import java.util.concurrent.ExecutorService

class ServiceApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServiceApi {
    override fun getAvailableServices(callback: (Result<List<ServiceInfoDto?>>) -> Unit) {
        executor.execute {
            try {
                val services = NewPipe.getServices().map { service ->
                    ServiceInfoDto(
                        serviceId = service.serviceId.toLong(),
                        name = service.serviceInfo.name,
                        baseUrl = try { service.baseUrl } catch (_: Exception) { null }
                    )
                }
                handler.post { callback(Result.success(services)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }
}
