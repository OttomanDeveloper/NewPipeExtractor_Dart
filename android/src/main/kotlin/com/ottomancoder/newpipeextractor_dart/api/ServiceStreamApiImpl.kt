package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import org.schabi.newpipe.extractor.InfoItem
import org.schabi.newpipe.extractor.NewPipe
import java.util.concurrent.ExecutorService

class ServiceStreamApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServiceStreamApi {

    private val cachedExtractors = mutableMapOf<Pair<Int, String>, org.schabi.newpipe.extractor.stream.StreamExtractor>()

    private fun getOrFetchExtractor(serviceId: Int, url: String): org.schabi.newpipe.extractor.stream.StreamExtractor {
        val key = Pair(serviceId, url)
        cachedExtractors[key]?.let { return it }
        val service = NewPipe.getService(serviceId)
        val extractor = service.getStreamExtractor(url)
        extractor.fetchPage()
        cachedExtractors[key] = extractor
        return extractor
    }

    override fun getStreamInfo(serviceId: Long, url: String, callback: (Result<VideoInfoDto>) -> Unit) {
        executor.execute {
            try {
                val extractor = getOrFetchExtractor(serviceId.toInt(), url)
                val dto = ExtractorHelper.mapVideoInfo(extractor)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getStreams(serviceId: Long, url: String, callback: (Result<StreamsDto>) -> Unit) {
        executor.execute {
            try {
                val extractor = getOrFetchExtractor(serviceId.toInt(), url)
                val dto = StreamsDto(
                    audioStreams = try { extractor.audioStreams.map { ExtractorHelper.mapAudioStream(it) } } catch (_: Exception) { emptyList() },
                    videoOnlyStreams = try { extractor.videoOnlyStreams.map { ExtractorHelper.mapVideoStream(it) } } catch (_: Exception) { emptyList() },
                    videoStreams = try { extractor.videoStreams.map { ExtractorHelper.mapVideoStream(it) } } catch (_: Exception) { emptyList() },
                    subtitleStreams = try { extractor.subtitlesDefault.map { ExtractorHelper.mapSubtitleStream(it) } } catch (_: Exception) { emptyList() },
                    segments = try { extractor.streamSegments.map { ExtractorHelper.mapSegment(it) } } catch (_: Exception) { emptyList() },
                    framesets = try { extractor.frames.map { ExtractorHelper.mapFrameset(it) } } catch (_: Exception) { emptyList() }
                )
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getRelatedItems(serviceId: Long, url: String, callback: (Result<SearchResultDto>) -> Unit) {
        executor.execute {
            try {
                val extractor = getOrFetchExtractor(serviceId.toInt(), url)
                val collector = extractor.relatedItems
                @Suppress("UNCHECKED_CAST")
                val items = collector?.items as? List<InfoItem> ?: emptyList()
                handler.post { callback(Result.success(ExtractorHelper.categorizeInfoItems(items))) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
