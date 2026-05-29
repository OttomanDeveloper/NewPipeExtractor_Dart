package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import org.schabi.newpipe.extractor.NewPipe
import java.io.ByteArrayInputStream
import java.util.concurrent.ExecutorService

/**
 * Reads subscription lists. NewPipe's [SubscriptionExtractor] is read-only extraction,
 * not account login: [fromChannelUrl] works only where a channel's subscriptions are
 * public, and [fromInputStream] parses exported files (YouTube Takeout, NewPipe .json,
 * SoundCloud). Most services return a null extractor — [getSupportedSources] reports
 * what a given service actually supports.
 */
class SubscriptionApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : SubscriptionApi {

    override fun getSupportedSources(serviceId: Long, callback: (Result<List<String?>>) -> Unit) {
        executor.execute {
            try {
                val sub = NewPipe.getService(serviceId.toInt()).subscriptionExtractor
                val sources = sub?.supportedSources?.map { it.name } ?: emptyList()
                handler.post { callback(Result.success(sources)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getRelatedUrl(serviceId: Long, callback: (Result<String?>) -> Unit) {
        executor.execute {
            try {
                val sub = NewPipe.getService(serviceId.toInt()).subscriptionExtractor
                handler.post { callback(Result.success(sub?.relatedUrl)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun fromChannelUrl(
        serviceId: Long,
        channelUrl: String,
        callback: (Result<List<SubscriptionItemDto?>>) -> Unit
    ) {
        executor.execute {
            try {
                val sub = NewPipe.getService(serviceId.toInt()).subscriptionExtractor
                    ?: throw Exception("Subscriptions not supported by service $serviceId")
                val items = sub.fromChannelUrl(channelUrl).map { mapItem(it.serviceId, it.url, it.name) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun fromInputStream(
        serviceId: Long,
        content: ByteArray,
        contentType: String,
        callback: (Result<List<SubscriptionItemDto?>>) -> Unit
    ) {
        executor.execute {
            try {
                val sub = NewPipe.getService(serviceId.toInt()).subscriptionExtractor
                    ?: throw Exception("Subscriptions not supported by service $serviceId")
                val stream = ByteArrayInputStream(content)
                val rawItems = if (contentType.isEmpty()) {
                    sub.fromInputStream(stream)
                } else {
                    sub.fromInputStream(stream, contentType)
                }
                val items = rawItems.map { mapItem(it.serviceId, it.url, it.name) }
                handler.post { callback(Result.success(items)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    private fun mapItem(serviceId: Int, url: String?, name: String?): SubscriptionItemDto =
        SubscriptionItemDto(serviceId = serviceId.toLong(), url = url, name = name)
}
