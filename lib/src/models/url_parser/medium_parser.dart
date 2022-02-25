import 'url_parser.dart';

class MediumParser extends UrlParser {
  /// Notice : We're not using {user}.medium.com as our main because
  /// not all users got this url endpoint enabled, while
  /// for those who have, medium.com/@{user} will redirect
  /// to their {user}.medium.com page.
  const MediumParser()
      : super(
          service: "Medium",
          hosts: const ["medium.com", "{user}.medium.com", "www.medium.com"],
          pathSegments: const ["{user}"],
        );

  /// Checks if the given uri is a valid uri.
  ///
  /// In addition to the basic checks, the following things are
  /// checked to ensure the parsed URI is a valid Medium URL :
  ///
  /// * It has strictly a single path segment, or none.
  @override
  String? isValidUrl(String uriString) {
    final uri = Uri.parse(uriString);
    final path = uri.pathSegments;
    if (path.length > 1) {
      return "More than one path segment";
    }
    return super.isValidUrl(uriString);
  }

  /// Overriding the recreateUri method to automatically
  /// the `@` prefix to the username if it isn't already there.
  @override
  String recreateUri(String user) {
    final mediumUser = user.startsWith("@") ? user : "@$user";
    return super.recreateUri(mediumUser);
  }
}
