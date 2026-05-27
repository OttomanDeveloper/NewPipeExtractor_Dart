import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/utils/http_client.dart';

class ReCaptchaPage extends StatefulWidget {
  const ReCaptchaPage({super.key});

  @override
  State<ReCaptchaPage> createState() => _ReCaptchaPageState();
}

class _ReCaptchaPageState extends State<ReCaptchaPage> {
  InAppWebViewController? controller;
  String foundCookies = '';
  final _cookieApi = CookieApi();

  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context)!.settings.arguments as String;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: ListTile(
            title: const Text('reCaptcha', style: TextStyle(color: Colors.white)),
            subtitle: Text(
              'Solve the reCaptcha and confirm',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
            ),
          ),
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.check_rounded),
              color: Colors.white,
              onPressed: () async {
                if (controller != null) {
                  final currentUrl = (await controller!.getUrl())?.toString() ?? '';
                  final cookies = await _cookieApi.getCookieByUrl(currentUrl);
                  handleCookies(cookies);

                  // Check for google_abuse cookie in the URL
                  if (currentUrl.contains('google_abuse=')) {
                    final googleAbuse = Uri.parse(currentUrl).queryParameters['google_abuse'];
                    if (googleAbuse != null) {
                      final decoded = await _cookieApi.decodeCookie(googleAbuse);
                      handleCookies(decoded);
                    }
                  }

                  // Persist cookies to native DownloaderImpl
                  if (foundCookies.isNotEmpty) {
                    await _cookieApi.setCookie(foundCookies);
                  }
                }
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(url),
            headers: ExtractorHttpClient.defaultHeaders,
          ),
          onLoadStop: (InAppWebViewController cont, _) {
            controller = cont;
          },
        ),
      ),
    );
  }

  void handleCookies(String? cookies) {
    if (cookies == null) {
      return;
    }
    if (cookies.contains('s_gl=') ||
        cookies.contains('goojf=') ||
        cookies.contains('VISITOR_INFO1_LIVE=') ||
        cookies.contains('GOOGLE_ABUSE_EXEMPTION=')) {
      if (foundCookies.contains(cookies)) {
        return;
      }
      if (foundCookies.isEmpty || foundCookies.endsWith('; ')) {
        foundCookies += cookies;
      } else if (foundCookies.endsWith(';')) {
        foundCookies += ' $cookies';
      } else {
        foundCookies += '; $cookies';
      }
    }
  }
}
