import '../../../fl_business_card_core.dart';

class CustomParser extends UrlParser {
  const CustomParser()
      // coverage:ignore-line
      : super(
          service: "Custom",
          hosts: const ["*"],
        );

  @override
  String recoverUser(String uriString) {
    final uri = Uri.parse(uriString);
    return "${uri.host}${uri.path}${uri.query}${uri.fragment}";
  }

  /// In the specific case of the CustomParser,
  /// the [user] String is in fact the whole URL,
  /// minus the scheme (to save space).
  ///
  /// We just add it back.
  @override
  String recreateUri(String user) {
    final uri = Uri.parse(user);
    return "https://${uri.host}${uri.path}${uri.query}${uri.fragment}";
  }
}
