import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/models/search_result.dart';
import 'package:newpipeextractor_dart/src/models/page_token.dart';

/// A page of stream items plus the continuation token for the next page.
/// `next == null` means there are no more pages.
typedef StreamPage = ({List<StreamInfoItem> items, PageToken? next});

/// A search result (videos + channels + playlists) plus the continuation token.
typedef SearchPage = ({SearchResult result, PageToken? next});
