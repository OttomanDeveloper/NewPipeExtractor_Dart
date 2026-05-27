import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

/// Parses and validates YouTube URLs.
class UrlExtractor {
  static final _api = UrlApi();

  /// Extracts the video ID from a YouTube video URL. Returns null on failure.
  static Future<String?> getIdFromStreamUrl(String url) => _api.getIdFromStreamUrl(url);

  /// Extracts the playlist ID from a YouTube playlist URL. Returns null on failure.
  static Future<String?> getIdFromPlaylistUrl(String url) => _api.getIdFromPlaylistUrl(url);

  /// Extracts the channel ID from a YouTube channel URL. Returns null on failure.
  static Future<String?> getIdFromChannelUrl(String url) => _api.getIdFromChannelUrl(url);

  /// Returns true if the URL is a valid YouTube video URL.
  static Future<bool> isValidStreamUrl(String url) => _api.isValidStreamUrl(url);

  /// Returns true if the URL is a valid YouTube playlist URL.
  static Future<bool> isValidPlaylistUrl(String url) => _api.isValidPlaylistUrl(url);

  /// Returns true if the URL is a valid YouTube channel URL.
  static Future<bool> isValidChannelUrl(String url) => _api.isValidChannelUrl(url);
}
