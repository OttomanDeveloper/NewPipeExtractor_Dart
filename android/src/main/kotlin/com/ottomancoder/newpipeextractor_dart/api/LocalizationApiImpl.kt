package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.localization.ContentCountry
import org.schabi.newpipe.extractor.localization.Localization
import java.util.concurrent.ExecutorService

class LocalizationApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : LocalizationApi {

    override fun setLocalization(languageCode: String, countryCode: String, callback: (Result<Unit>) -> Unit) {
        executor.execute {
            try {
                NewPipe.setupLocalization(
                    Localization(languageCode, countryCode),
                    ContentCountry(countryCode)
                )
                handler.post { callback(Result.success(Unit)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getSupportedLocalizations(
        serviceId: Long,
        callback: (Result<List<LocalizationDto?>>) -> Unit
    ) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val list = service.supportedLocalizations.map {
                    LocalizationDto(
                        languageCode = it.languageCode,
                        countryCode = it.countryCode,
                        localizationCode = it.localizationCode
                    )
                }
                handler.post { callback(Result.success(list)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getSupportedCountries(
        serviceId: Long,
        callback: (Result<List<ContentCountryDto?>>) -> Unit
    ) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val list = service.supportedCountries.map {
                    ContentCountryDto(countryCode = it.countryCode)
                }
                handler.post { callback(Result.success(list)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }
}
