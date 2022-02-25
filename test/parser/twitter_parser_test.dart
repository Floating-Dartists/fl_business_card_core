import 'package:fl_business_card_core/fl_business_card_core.dart'
    show TwitterParser;
import 'package:test/test.dart';

void main() {
  group('TwitterParser', () {
    const tValidUrl = 'https://twitter.com/ABC38_';
    const tInvalidUrl = 'https://twittercom/status/ABC38_';

    const tvalidUsername = "ABC38_";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(const TwitterParser().isValid(tValidUrl), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          const TwitterParser().isValid(tInvalidUrl),
          false,
        );
      });
    });

    group('recoverUser', () {
      test('A valid Twitter Url should return the user', () {
        expect(
          const TwitterParser().recoverUser(tValidUrl),
          tvalidUsername,
        );
      });
    });

    group('recreateUri', () {
      test('A valid Twitter username should return the tValidUrl', () {
        expect(
          const TwitterParser().recreateUri(tvalidUsername),
          tValidUrl,
        );
      });
    });
  });
}
