import 'url_parser.dart';

class TwitterParser extends UrlParser {
  const TwitterParser()
      : super(
          service: "Twitter",
          hosts: const ["twitter.com", "www.twitter.com"],
          pathSegments: const ["{user}"],
        );

  /// Checks if the given uri is a valid uri.
  ///
  /// In addition to the basic checks, the following things are
  /// checked to ensure the parsed URI is a valid Twitter URL :
  ///
  /// * It has strictly a single path segment (which is the Twitter Username).
  @override
  String? isValidUrl(String uriString) {
    final uri = Uri.parse(uriString);
    final path = uri.pathSegments;
    if (path.length != 1) {
      return "More than one path segment";
    }
    return super.isValidUrl(uriString);
  }
}
