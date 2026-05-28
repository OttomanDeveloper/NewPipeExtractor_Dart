package com.ottomancoder.newpipeextractor_dart.api

import android.os.Handler
import com.ottomancoder.newpipeextractor_dart.*
import com.ottomancoder.newpipeextractor_dart.toFlutterResult
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapAudioStream
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapFrameset
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapSegment
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapSubtitleStream
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapVideoInfo
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.mapVideoStream
import com.ottomancoder.newpipeextractor_dart.ExtractorHelper.categorizeInfoItems
import org.schabi.newpipe.extractor.InfoItem
import org.schabi.newpipe.extractor.ServiceList.YouTube
import java.util.concurrent.ExecutorService

class VideoExtractorApiImpl(
    private val executor: ExecutorService,
    private val handler: Handler
) : VideoExtractorApi {

    private var cachedExtractor: org.schabi.newpipe.extractor.stream.StreamExtractor? = null
    private var cachedUrl: String? = null

    private fun getOrFetchExtractor(url: String): org.schabi.newpipe.extractor.stream.StreamExtractor {
        if (cachedUrl == url && cachedExtractor != null) return cachedExtractor!!
        val extractor = YouTube.getStreamExtractor(url)
        extractor.fetchPage()
        cachedExtractor = extractor
        cachedUrl = url
        return extractor
    }

    override fun getVideoInfo(url: String, callback: (Result<VideoInfoDto>) -> Unit) {
        executor.execute {
            try {
                val extractor = getOrFetchExtractor(url)
                val info = mapVideoInfo(extractor)
                handler.post { callback(Result.success(info)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getVideoStreams(url: String, callback: (Result<StreamsDto>) -> Unit) {
        executor.execute {
            try {
                val extractor = getOrFetchExtractor(url)

                val audioStreams = try { extractor.audioStreams.map { mapAudioStream(it) } } catch (e: Exception) { emptyList() }
                val videoOnlyStreams = try { extractor.videoOnlyStreams.map { mapVideoStream(it) } } catch (e: Exception) { emptyList() }
                val videoStreams = try { extractor.videoStreams.map { mapVideoStream(it) } } catch (e: Exception) { emptyList() }
                val subtitleStreams = try { extractor.subtitlesDefault.map { mapSubtitleStream(it) } } catch (e: Exception) { emptyList() }
                val segments = try { extractor.streamSegments.map { mapSegment(it) } } catch (e: Exception) { emptyList() }
                val framesets = try { extractor.frames.map { mapFrameset(it) } } catch (e: Exception) { emptyList() }

                val result = StreamsDto(
                    audioStreams = audioStreams,
                    videoOnlyStreams = videoOnlyStreams,
                    videoStreams = videoStreams,
                    subtitleStreams = subtitleStreams,
                    segments = segments,
                    framesets = framesets
                )
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getVideoSegments(url: String, callback: (Result<List<SegmentDto?>>) -> Unit) {
        executor.execute {
            try {
                val extractor = getOrFetchExtractor(url)
                val segments = extractor.streamSegments.map { mapSegment(it) }
                handler.post { callback(Result.success(segments)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }

    override fun getRelatedStreams(url: String, callback: (Result<SearchResultDto>) -> Unit) {
        executor.execute {
            try {
                val extractor = getOrFetchExtractor(url)
                @Suppress("UNCHECKED_CAST")
                val items = extractor.relatedItems?.items as? List<InfoItem> ?: emptyList()
                val result = categorizeInfoItems(items)
                handler.post { callback(Result.success(result)) }
            } catch (e: Exception) {
                handler.post { callback(e.toFlutterResult()) }
            }
        }
    }
}
