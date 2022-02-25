import '../parse_exceptions.dart';
import '../url_parser.dart';

class GithubParser extends UrlParser {
  const GithubParser()
      : super(
          service: "GitHub",
          hosts: const ["github.com", "www.github.com"],
          pathSegments: const ["{user}"],
        );

  /// Checks if the given uri is a valid uri.
  ///
  /// In addition to the basic checks, the following things are
  /// checked to ensure the parsed URI is a valid Github URL :
  ///
  /// * It has strictly a single path segment (which is the Github Username).
  /// (Do note it also works with GitHub organizations !)
  @override
  bool isValid(Uri uri) {
    super.isValid(uri);
    final path = uri.pathSegments;
    if (path.length != 1) {
      throw ParseException(
        parseType: service,
        message: "More than one path segment",
      );
    }
    return true;
  }
}