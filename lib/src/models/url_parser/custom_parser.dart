import '../../../fl_business_card_core.dart';
import '../url_parse_exceptions.dart';

class CustomParser extends UrlParser {
  const CustomParser()
      : super(
          service: "Custom",
          hosts: const ["*"],
        );

  @override
  String recoverUser(String uriString) {
    try {
      final uri = Uri.tryParse(uriString);
      if (uri == null) {
        throw UrlParseException(
          parseType: service,
          message: "Invalid Custom URL",
        );
      }
      isValid(uri);
      return "${uri.host}${uri.path}${uri.query}${uri.fragment}";
    } on UrlParseException {
      rethrow;
    }
  }

  /// In the specific case of the CustomParser,
  /// the [user] String is in fact the whole URL,
  /// minus the scheme (to save space).
  ///
  /// We just add it back.
  @override
  String recreateUri(String user) {
    final uri = Uri.tryParse(user);
    if (uri == null) {
      throw UrlParseException(
        parseType: service,
        message: "Invalid Custom URL",
      );
    }
    return "https://${uri.host}${uri.path}${uri.query}${uri.fragment}";
  }
}
