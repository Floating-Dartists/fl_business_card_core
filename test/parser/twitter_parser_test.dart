import 'package:fl_business_card_core/fl_business_card_core.dart'
    show TwitterParser;
import 'package:test/test.dart';

void main() {
  group('TwitterParser', () {
    const parser = TwitterParser();

    const tValidUrl = 'https://twitter.com/ABC38_';
    const tInvalidUrl = 'https://twittercom/status/ABC38_';

    const tvalidUsername = "ABC38_";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(parser.isValid(tValidUrl), true);
      });

      test('An invalid URL should return false', () {
        expect(
          parser.isValid(tInvalidUrl),
          false,
        );
      });
    });

    group('recoverUser', () {
      test('A valid Twitter Url should return the user', () {
        expect(
          parser.recoverUser(tValidUrl),
          tvalidUsername,
        );
      });
    });

    group('recreateUri', () {
      test('A valid Twitter username should return the tValidUrl', () {
        expect(
          parser.recreateUri(tvalidUsername),
          tValidUrl,
        );
      });
    });
  });
}
