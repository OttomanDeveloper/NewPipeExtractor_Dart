import 'package:flutter/services.dart';

/// Callback invoked when a reCAPTCHA challenge is needed.
/// The [challengeUrl] should be opened in a WebView for the user to solve.
typedef ReCaptchaNavigator = Future<void> Function(String challengeUrl);

ReCaptchaNavigator? _reCaptchaNavigator;

/// Registers the callback for handling reCAPTCHA challenges.
/// Call this once at app startup. See [ReCaptchaPage] for a ready-made widget.
void setReCaptchaNavigator(ReCaptchaNavigator navigator) {
  _reCaptchaNavigator = navigator;
}

Future<T> withReCaptchaRetry<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on PlatformException catch (e) {
    if (e.code == 'RECAPTCHA' && _reCaptchaNavigator != null) {
      final url = (e.details as String?) ?? e.message ?? '';
      await _reCaptchaNavigator!(url);
      return await call();
    }
    rethrow;
  }
}
