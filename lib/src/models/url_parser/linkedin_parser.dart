import '../parse_exceptions.dart';
import '../url_parser.dart';

class LinkedInParser extends UrlParser {
  const LinkedInParser()
      : super(
          service: "LinkedIn",
          hosts: const ["linkedin.com", "www.linkedin.com"],
          pathSegments: const ["in", "{user}"],
        );

  /// Checks if the given uri is a valid uri.
  ///
  /// In addition to the basic checks, the following things are
  /// checked to ensure the parsed URI is a valid LinkedIn URL :
  ///
  /// * It has strictly two path segments ("in", then the username).
  @override
  bool isValid(Uri uri) {
    super.isValid(uri);
    final path = uri.pathSegments;
    if (path.length != 2) {
      throw ParseException(
        parseType: service,
        message: "Incorrect number of path segments",
      );
    }
    return true;
  }
}
