import '../url_parse_exceptions.dart';
import '../url_parser.dart';

class GitlabParser extends UrlParser {
  const GitlabParser()
      : super(
          service: "GitLab",
          hosts: const ["gitlab.com", "www.gitlab.com"],
          pathSegments: const ["{user}"],
        );

  /// Checks if the given uri is a valid uri.
  ///
  /// In addition to the basic checks, the following things are
  /// checked to ensure the parsed URI is a valid GitLab URL :
  ///
  /// * It has strictly a single path segment (which is the Gitlab Username).
  @override
  String? isValidUrl(Uri uri) {
    final path = uri.pathSegments;
    if (path.length != 1) {
      return "More than one path segment";
    }
    return super.isValidUrl(uri);
  }
}
