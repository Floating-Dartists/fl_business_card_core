import 'package:fl_business_card_core/fl_business_card_core.dart'
    show StackOverflowParser;
import 'package:test/test.dart';

void main() {
  group('StackOverflowParser', () {
    const parser = StackOverflowParser();

    const tValidUrl = 'https://stackoverflow.com/users/13923049/me%c3%af-m';
    const tValidUrl2 = 'https://stackoverflow.com/users/13923049';
    const tInvalidUrl = 'https://stackoverflow.com/13923049';
    const tvalidUsername = "13923049";

    group('super constructor', () {
      test('should return a valid instance', () {
        expect(parser, isNotNull);
      });

      test('should return a valid instance', () {
        expect(parser, isA<StackOverflowParser>());
      });

      test('should contain the right parameters', () {
        expect(parser.service, 'Stack Overflow');
        expect(
          parser.hosts,
          const ["stackoverflow.com", "www.stackoverflow.com"],
        );
        expect(parser.schemes, const ["https", "http", ""]);
        expect(parser.pathSegments, const ["users", "{user}"]);
        expect(parser.queryParameters, const {});
      });
    });

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(parser.isValid(tValidUrl), true);
      });

      test('A valid URL should return true', () {
        expect(
          parser.isValid(tValidUrl2),
          true,
        );
      });

      test('An invalid URL should return false', () {
        expect(
          parser.isValid(tInvalidUrl),
          false,
        );
      });
    });

    group('recoverUser', () {
      test('A valid StackOverflow Url should return the user', () {
        expect(
          parser.recoverUser(tValidUrl),
          tvalidUsername,
        );
      });

      test('A valid StackOverflow Url should return the user', () {
        expect(
          parser.recoverUser(tValidUrl2),
          tvalidUsername,
        );
      });
    });

    group('recreateUri', () {
      test('A valid StackOverflow username should return the tValidUrl', () {
        expect(
          parser.recreateUri(tvalidUsername),
          tValidUrl2,
        );
      });
    });
  });
}
