package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.LocalizationApi
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
}
