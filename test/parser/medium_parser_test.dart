import 'package:fl_business_card_core/fl_business_card_core.dart'
    show MediumParser;
import 'package:test/test.dart';

void main() {
  group('MediumParser', () {
    const parser = MediumParser();

    const tValidUrl = 'https://rouxguillaume.medium.com/';
    const tValidUrl2 = 'https://medium.com/@rouxguillaume';
    const tInvalidUrl = 'https://rouxguillaume.medium.com/@rouxguillaume/truc';
    const tvalidUsername = "rouxguillaume";
    const tvalidUsername2 = "@rouxguillaume";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(parser.isValid(tValidUrl), true);
      });

      test('A valid URL should return true', () {
        expect(parser.isValid(tValidUrl2), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          parser.isValid(tInvalidUrl),
          false,
        );
      });
    });

    group('recoverUser', () {
      test('A valid Medium Url should return the user', () {
        expect(
          parser.recoverUser(tValidUrl),
          tvalidUsername,
        );
      });

      test('A valid Medium Url should return the user', () {
        expect(
          parser.recoverUser(tValidUrl2),
          tvalidUsername2,
        );
      });
    });

    group('recreateUri', () {
      test('A valid Medium username should return the tValidUrl', () {
        expect(
          parser.recreateUri(tvalidUsername),
          tValidUrl2,
        );
      });

      test('A valid Medium username should return the tValidUrl', () {
        expect(
          parser.recreateUri(tvalidUsername2),
          tValidUrl2,
        );
      });
    });
  });
}
