package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import org.schabi.newpipe.extractor.InfoItem
import org.schabi.newpipe.extractor.NewPipe
import java.util.concurrent.ExecutorService

class ServiceStreamApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : ServiceStreamApi {

    override fun getStreamInfo(serviceId: Long, url: String, callback: (Result<VideoInfoDto>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val extractor = service.getStreamExtractor(url)
                extractor.fetchPage()
                val dto = ExtractorHelper.mapVideoInfo(extractor)
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getStreams(serviceId: Long, url: String, callback: (Result<StreamsDto>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val extractor = service.getStreamExtractor(url)
                extractor.fetchPage()
                val dto = StreamsDto(
                    audioStreams = extractor.audioStreams.map { ExtractorHelper.mapAudioStream(it) },
                    videoOnlyStreams = extractor.videoOnlyStreams.map { ExtractorHelper.mapVideoStream(it) },
                    videoStreams = extractor.videoStreams.map { ExtractorHelper.mapVideoStream(it) },
                    subtitleStreams = try {
                        extractor.subtitlesDefault.map { ExtractorHelper.mapSubtitleStream(it) }
                    } catch (_: Exception) { emptyList() },
                    segments = extractor.streamSegments.map { ExtractorHelper.mapSegment(it) },
                    framesets = try {
                        extractor.frames.map { ExtractorHelper.mapFrameset(it) }
                    } catch (_: Exception) { emptyList() }
                )
                handler.post { callback(Result.success(dto)) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }

    override fun getRelatedItems(serviceId: Long, url: String, callback: (Result<SearchResultDto>) -> Unit) {
        executor.execute {
            try {
                val service = NewPipe.getService(serviceId.toInt())
                val extractor = service.getStreamExtractor(url)
                extractor.fetchPage()
                val collector = extractor.relatedItems
                @Suppress("UNCHECKED_CAST")
                val items = collector?.items as? List<InfoItem> ?: emptyList()
                handler.post { callback(Result.success(ExtractorHelper.categorizeInfoItems(items))) }
            } catch (e: Exception) {
                handler.post { callback(Result.failure(e)) }
            }
        }
    }
}
