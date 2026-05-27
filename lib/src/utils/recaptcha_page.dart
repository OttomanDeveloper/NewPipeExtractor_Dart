import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:newpipeextractor_dart/src/utils/http_client.dart';

bool resolvingCaptcha = false;

class ReCaptchaPage extends StatefulWidget {
  const ReCaptchaPage({super.key});

  @override
  _ReCaptchaPageState createState() => _ReCaptchaPageState();
}

class _ReCaptchaPageState extends State<ReCaptchaPage> {
  InAppWebViewController? controller;
  String foundCookies = "";

  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context)!.settings.arguments as String;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: ListTile(
            title: Text("reCaptcha", style: TextStyle(color: Colors.white)),
            subtitle: Text("Solve the reCaptcha and confirm",
                style: TextStyle(color: Colors.white.withOpacity(0.6))),
          ),
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.check_rounded),
              color: Colors.white,
              onPressed: () async {
                Navigator.pop(context);
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
    if (cookies.contains("s_gl=") ||
        cookies.contains("goojf=") ||
        cookies.contains("VISITOR_INFO1_LIVE=") ||
        cookies.contains("GOOGLE_ABUSE_EXEMPTION=")) {
      if (foundCookies.contains(cookies)) {
        return;
      }
      if (foundCookies.isEmpty || foundCookies.endsWith("; ")) {
        foundCookies += cookies;
      } else if (foundCookies.endsWith(";")) {
        foundCookies += " " + cookies;
      } else {
        foundCookies += "; " + cookies;
      }
    }
  }
}
