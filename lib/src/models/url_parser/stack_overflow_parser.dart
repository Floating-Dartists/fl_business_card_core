import 'url_parser.dart';

class StackOverflowParser extends UrlParser {
  const StackOverflowParser()
      // coverage:ignore-start
      : super(
          // coverage:ignore-end
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
  String? isValidUrl(String uriString) {
    final uri = Uri.parse(uriString);
    final path = uri.pathSegments;
    if (path.length < 2 || path.length > 3) {
      return "Incorrect number of path segments";
    }
    return super.isValidUrl(uriString);
  }
}
