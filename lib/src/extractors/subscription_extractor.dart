import 'dart:typed_data';

import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/subscription_item.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// Reads subscription lists from any service that supports it.
///
/// This is **read-only extraction, not account login**:
/// - [fromChannelUrl] works only where a channel's subscriptions are public.
/// - [fromFile] parses an exported subscription file (YouTube Takeout,
///   NewPipe `.json`, SoundCloud).
///
/// Most services support neither — call [getSupportedSources] first to find out.
/// Source values are `'CHANNEL_URL'` and `'INPUT_STREAM'`.
class SubscriptionExtractor {
  static final _api = SubscriptionApi();

  /// Returns the supported import sources for a service, e.g. `['CHANNEL_URL']`.
  /// An empty list means the service has no subscription extractor.
  static Future<List<String>> getSupportedSources(int serviceId) async {
    final sources = await _api.getSupportedSources(serviceId);
    return sources.whereType<String>().toList();
  }

  /// Returns the URL where a user can find the data needed for import, if any.
  static Future<String?> getRelatedUrl(int serviceId) =>
      _api.getRelatedUrl(serviceId);

  /// Extracts the (public) subscription list of the channel at [channelUrl].
  /// Throws if the service does not support subscription extraction.
  static Future<List<SubscriptionItem>> fromChannelUrl(int serviceId, String channelUrl) async {
    final dtos = await withReCaptchaRetry(() => _api.fromChannelUrl(serviceId, channelUrl));
    return dtos.whereType<SubscriptionItemDto>().map(m.mapSubscriptionItem).toList();
  }

  /// Parses an exported subscription file's bytes. Pass [contentType] when the
  /// service needs it to pick a parser (e.g. a MIME type); leave empty to let
  /// the extractor infer. Throws if the service does not support file import.
  static Future<List<SubscriptionItem>> fromFile(
    int serviceId,
    Uint8List content, {
    String contentType = '',
  }) async {
    final dtos = await _api.fromInputStream(serviceId, content, contentType);
    return dtos.whereType<SubscriptionItemDto>().map(m.mapSubscriptionItem).toList();
  }
}
