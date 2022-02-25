import 'url_parser.dart';

class LinkedInParser extends UrlParser {
  const LinkedInParser()
      // coverage:ignore-start
      : super(
          // coverage:ignore-end
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
  String? isValidUrl(String uriString) {
    final uri = Uri.parse(uriString);
    final path = uri.pathSegments;
    if (path.length != 2) {
      return "Incorrect number of path segments";
    }
    return super.isValidUrl(uriString);
  }
}
