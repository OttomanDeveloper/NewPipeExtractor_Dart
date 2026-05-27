import 'package:flutter/services.dart';

typedef ReCaptchaNavigator = Future<void> Function(String challengeUrl);

ReCaptchaNavigator? _reCaptchaNavigator;

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
