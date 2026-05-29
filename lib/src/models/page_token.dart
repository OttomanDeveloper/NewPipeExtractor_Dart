import 'dart:typed_data';
import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

/// Opaque continuation token for a paginated list.
///
/// Hold it in your state and pass it back to the matching `...NextPage(...)`
/// call to fetch the following page. A `null` token means there are no more
/// pages. Each list owns its own token, so independent lists never interfere.
class PageToken {
  final String? url;
  final String? id;
  final List<String>? ids;
  final Map<String, String>? cookies;
  final Uint8List? body;

  const PageToken({this.url, this.id, this.ids, this.cookies, this.body});

  /// Serializes back to the Pigeon DTO for a `...NextPage` host call.
  PageDto toDto() => PageDto(url: url, id: id, ids: ids, cookies: cookies, body: body);

  /// Builds a [PageToken] from a host [PageDto], or `null` if there is no next page.
  static PageToken? fromDto(PageDto? d) {
    if (d == null) return null;
    return PageToken(
      url: d.url,
      id: d.id,
      ids: d.ids?.whereType<String>().toList(),
      cookies: d.cookies == null
          ? null
          : <String, String>{
              for (final MapEntry<String?, String?> e in d.cookies!.entries)
                if (e.key != null && e.value != null) e.key!: e.value!,
            },
      body: d.body,
    );
  }
}
