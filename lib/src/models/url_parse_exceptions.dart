class UrlParseException implements Exception {
  final String parseType;
  final String message;

  UrlParseException({
    required this.parseType,
    required this.message,
  });

  @override
  String toString() {
    return "[ParseException] in $parseType: $message";
  }
}
