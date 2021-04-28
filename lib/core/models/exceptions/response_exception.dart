class ResponseException implements Exception {
  late String cause;

  ResponseException(this.cause);
}
