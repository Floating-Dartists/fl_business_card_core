class ParseException implements Exception {
  final String parseType;
  final String message;

  ParseException({
    required this.parseType,
    required this.message,
  });

  @override
  String toString() {
    return "[ParseException] in $parseType: $message";
  }
}
