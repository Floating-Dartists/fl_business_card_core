import 'package:fl_business_card_core/fl_business_card_core.dart'
    show StackOverflowParser;
import 'package:fl_business_card_core/src/models/url_parse_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('StackOverflowParser', () {
    const tValidUrl = 'https://stackoverflow.com/users/13923049/me%c3%af-m';
    const tValidUrl2 = 'https://stackoverflow.com/users/13923049';
    const tInvalidUrl = 'https://stackoverflow.com/13923049';
    const tvalidUsername = "13923049";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(const StackOverflowParser().isValid(Uri.parse(tValidUrl)), true);
      });

      test('A valid URL should return true', () {
        expect(
            const StackOverflowParser().isValid(Uri.parse(tValidUrl2)), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          const StackOverflowParser().isValid(Uri.parse(tInvalidUrl)),
          false,
        );
      });
    });

    group('recoverUser', () {
      test('A valid StackOverflow Url should return the user', () {
        expect(
          const StackOverflowParser().recoverUser(tValidUrl),
          tvalidUsername,
        );
      });

      test('A valid StackOverflow Url should return the user', () {
        expect(
          const StackOverflowParser().recoverUser(tValidUrl2),
          tvalidUsername,
        );
      });
    });

    group('recreateUri', () {
      test('A valid StackOverflow username should return the tValidUrl', () {
        expect(
          const StackOverflowParser().recreateUri(tvalidUsername),
          tValidUrl2,
        );
      });
    });
  });
}
