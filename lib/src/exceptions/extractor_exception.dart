/// Base class for all extraction errors. Use pattern matching for exhaustive handling.
sealed class ExtractorException implements Exception {
  String get message;

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when a URL is null, empty, or malformed.
class BadUrlException extends ExtractorException {
  @override
  final String message;
  BadUrlException(this.message);
}

/// Thrown when attempting to access streams that weren't loaded.
class StreamIsNullException extends ExtractorException {
  @override
  final String message;
  StreamIsNullException(this.message);
}

/// Thrown on HTTP 4xx errors. Usually means YouTube changed their API.
class FatalFailureException extends ExtractorException {
  @override
  final String message;
  FatalFailureException(this.message);
}

/// Thrown on HTTP 5xx errors. Retry later -- the issue is on YouTube's side.
class TransientFailureException extends ExtractorException {
  @override
  final String message;
  TransientFailureException(this.message);
}

/// Thrown on HTTP 429 or Google rate-limiting. Wait before retrying.
class RequestLimitExceededException extends ExtractorException {
  @override
  final String message;
  RequestLimitExceededException(this.message);
}

/// Thrown when YouTube requires CAPTCHA verification.
/// In practice, reCAPTCHA challenges are handled automatically via
/// [setReCaptchaNavigator]. This exception is available for consumers
/// who need to handle reCAPTCHA in custom ways.
class ReCaptchaRequiredException extends ExtractorException {
  @override
  final String message;
  final String? challengeUrl;
  ReCaptchaRequiredException(this.message, {this.challengeUrl});
}
