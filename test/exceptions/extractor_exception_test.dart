import 'package:flutter_test/flutter_test.dart';
import 'package:newpipeextractor_dart/newpipeextractor_dart.dart';

void main() {
  test('sealed ExtractorException pattern matching is exhaustive', () {
    ExtractorException error = BadUrlException('test');
    final result = switch (error) {
      BadUrlException() => 'bad_url',
      StreamIsNullException() => 'null_stream',
      FatalFailureException() => 'fatal',
      TransientFailureException() => 'transient',
      RequestLimitExceededException() => 'rate_limit',
      ReCaptchaRequiredException() => 'recaptcha',
    };
    expect(result, 'bad_url');
  });

  test('toString includes class name and message', () {
    final e = FatalFailureException('YouTube broke');
    expect(e.toString(), 'FatalFailureException: YouTube broke');
  });

  test('ReCaptchaRequiredException holds challengeUrl', () {
    final e = ReCaptchaRequiredException('captcha needed', challengeUrl: 'https://example.com');
    expect(e.challengeUrl, 'https://example.com');
    expect(e.message, 'captcha needed');
  });
}
