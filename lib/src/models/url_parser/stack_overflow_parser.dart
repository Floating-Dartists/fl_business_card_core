import '../parse_exceptions.dart';
import '../url_parser.dart';

class StackOverflowParser extends UrlParser {
  const StackOverflowParser()
      : super(
          service: "Stack Overflow",
          hosts: const ["stackoverflow.com", "www.stackoverflow.com"],
          pathSegments: const ["users", "{user}"],
        );

  /// Checks if the given uri is a valid uri.
  ///
  /// In addition to the basic checks, the following things are
  /// checked to ensure the parsed URI is a valid StackOverflow URL :
  ///
  /// * It has between 2 and 3 path segments (inclusive).
  @override
  bool isValid(Uri uri) {
    super.isValid(uri);
    final path = uri.pathSegments;
    if (path.length < 2 || path.length > 3) {
      throw ParseException(
        parseType: service,
        message: "Incorrect number of path segments",
      );
    }
    return true;
  }
}
