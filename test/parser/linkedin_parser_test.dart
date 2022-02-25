import 'package:fl_business_card_core/fl_business_card_core.dart'
    show LinkedInParser;
import 'package:test/test.dart';

void main() {
  group('LinkedInParser', () {
    const parser = LinkedInParser();

    const tValidUrl = 'https://linkedin.com/in/ABC38_';
    const tInvalidUrl = 'https://linkedincom/ABC38_';

    const tvalidUsername = "ABC38_";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(parser.isValid(tValidUrl), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          parser.isValid(tInvalidUrl),
          false,
        );
      });
    });

    group('recoverUser', () {
      test('A valid LinkedIn Url should return the user', () {
        expect(
          parser.recoverUser(tValidUrl),
          tvalidUsername,
        );
      });
    });

    group('recreateUri', () {
      test('A valid LinkedIn username should return the tValidUrl', () {
        expect(
          parser.recreateUri(tvalidUsername),
          tValidUrl,
        );
      });
    });
  });
}
