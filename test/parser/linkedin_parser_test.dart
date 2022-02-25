import 'package:fl_business_card_core/fl_business_card_core.dart'
    show LinkedInParser;
import 'package:fl_business_card_core/src/models/url_parse_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('LinkedInParser', () {
    const tValidUrl = 'https://linkedin.com/in/ABC38_';
    const tInvalidUrl = 'https://linkedincom/ABC38_';

    const tvalidUsername = "ABC38_";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(const LinkedInParser().isValid(Uri.parse(tValidUrl)), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          const LinkedInParser().isValid(Uri.parse(tInvalidUrl)),
          false,
        );
      });
    });

    group('recoverUser', () {
      test('A valid LinkedIn Url should return the user', () {
        expect(
          const LinkedInParser().recoverUser(tValidUrl),
          tvalidUsername,
        );
      });
    });

    group('recreateUri', () {
      test('A valid LinkedIn username should return the tValidUrl', () {
        expect(
          const LinkedInParser().recreateUri(tvalidUsername),
          tValidUrl,
        );
      });
    });
  });
}
