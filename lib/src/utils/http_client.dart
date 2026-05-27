import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:newpipeextractor_dart/src/exceptions/extractor_exception.dart';

class ExtractorHttpClient {

  static const Map<String, String> defaultHeaders = {
    'user-agent':
        'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101 Firefox/68.0'
  };

  /// Byte range size for chunked downloads (~9.9 MB per request).
  static const int _chunkSize = 9898989;

  static Future<int?> getContentLength(String url) async {
    var response = await http.head(Uri.parse(url), headers: defaultHeaders);
    return int.tryParse(response.headers['content-length'] ?? '');
  }

  /// Downloads [url] in byte-range chunks, yielding data as it arrives.
  ///
  /// [size] is the total content length in bytes used to calculate range
  /// boundaries. Automatically retries up to 5 times on transient failures,
  /// resuming from the last received byte.
  static Stream<List<int>> getStream({
    required String url,
    required int size,
    Map<String, String>? headers,
    bool validate = true,
    int start = 0,
    int errorCount = 0,
  }) async* {
    var bytesCount = start;
    var client = http.Client();
    for (var i = start; i < size; i += _chunkSize) {
      try {
        final request = http.Request('get', Uri.parse(url));
        request.headers['range'] = 'bytes=$i-${i + _chunkSize - 1}';
        defaultHeaders.forEach((key, value) {
          if (request.headers[key] == null) {
            request.headers[key] = defaultHeaders[key]!;
          }
        });
        if (headers != null) {
          headers.forEach((key, value) {
            request.headers[key] = value;
          });
        }
        final response = await client.send(request);
        if (validate) {
          _validateResponse(response, response.statusCode);
        }
        final controller = StreamController<List<int>>();
        response.stream.listen((data) {
          bytesCount += data.length;
          controller.add(data);
        }, onError: (_) => null, onDone: controller.close, cancelOnError: false);
        errorCount = 0;
        yield* controller.stream;
      } on Exception {
        if (errorCount == 5) {
          client.close();
          rethrow;
        }
        client.close();
        await Future.delayed(const Duration(milliseconds: 500));
        yield* getStream(
            url: url,
            size: size,
            headers: headers,
            validate: validate,
            start: bytesCount,
            errorCount: errorCount + 1);
        break;
      }
    }
    client.close();
  }

  static void _validateResponse(http.BaseResponse response, int statusCode) {
    var request = response.request!;
    if (request.url.host.endsWith('.google.com') &&
        request.url.path.startsWith('/sorry/')) {
      throw RequestLimitExceededException(
        'Rate limited by YouTube. Request: ${response.request}, Response: $response',
      );
    }

    if (statusCode >= 500) {
      throw TransientFailureException(
        'Transient HTTP failure. Request: ${response.request}, Response: $response',
      );
    }

    if (statusCode == 429) {
      throw RequestLimitExceededException(
        'Rate limited by YouTube (429). Request: ${response.request}, Response: $response',
      );
    }

    if (statusCode >= 400) {
      throw FatalFailureException(
        'Fatal HTTP failure ($statusCode). Request: ${response.request}, Response: $response',
      );
    }
  }

}
