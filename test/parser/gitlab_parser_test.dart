import 'package:fl_business_card_core/fl_business_card_core.dart'
    show GitlabParser;
import 'package:fl_business_card_core/src/models/url_parse_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('GitlabParser', () {
    const tValidUrl = 'https://gitlab.com/ABC38_';
    const tInvalidUrl = 'https://gitlabcom/status/ABC38_';

    const tvalidUsername = "ABC38_";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(const GitlabParser().isValid(Uri.parse(tValidUrl)), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          () => const GitlabParser().isValid(Uri.parse(tInvalidUrl)),
          // const CustomParser().isValid(Uri.parse(tInvalidUrl)),
          throwsA(isA<UrlParseException>()),
        );
      });
    });

    group('recoverUser', () {
      test('A valid Gitlab Url should return the user', () {
        expect(
          const GitlabParser().recoverUser(tValidUrl),
          tvalidUsername,
        );
      });
    });

    group('recreateUri', () {
      test('A valid Gitlab username should return the tValidUrl', () {
        expect(
          const GitlabParser().recreateUri(tvalidUsername),
          tValidUrl,
        );
      });
    });
  });
}
