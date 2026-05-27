sealed class ExtractorException implements Exception {
  String get message;

  @override
  String toString() => '$runtimeType: $message';
}

class BadUrlException extends ExtractorException {
  @override
  final String message;
  BadUrlException(this.message);
}

class StreamIsNullException extends ExtractorException {
  @override
  final String message;
  StreamIsNullException(this.message);
}

class FatalFailureException extends ExtractorException {
  @override
  final String message;
  FatalFailureException(this.message);
}

class TransientFailureException extends ExtractorException {
  @override
  final String message;
  TransientFailureException(this.message);
}

class RequestLimitExceededException extends ExtractorException {
  @override
  final String message;
  RequestLimitExceededException(this.message);
}

class ReCaptchaRequiredException extends ExtractorException {
  @override
  final String message;
  final String? challengeUrl;
  ReCaptchaRequiredException(this.message, {this.challengeUrl});
}
