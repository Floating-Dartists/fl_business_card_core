import 'package:fl_business_card_core/fl_business_card_core.dart'
    show MediumParser;
import 'package:fl_business_card_core/src/models/parse_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('MediumParser', () {
    const tValidUrl = 'https://rouxguillaume.medium.com/';
    const tValidUrl2 = 'https://medium.com/@rouxguillaume';
    const tInvalidUrl = 'https://rouxguillaume.medium.com/@rouxguillaume/truc';
    const tvalidUsername = "rouxguillaume";
    const tvalidUsername2 = "@rouxguillaume";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(const MediumParser().isValid(Uri.parse(tValidUrl)), true);
      });

      test('A valid URL should return true', () {
        expect(const MediumParser().isValid(Uri.parse(tValidUrl2)), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          () => const MediumParser().isValid(Uri.parse(tInvalidUrl)),
          // const CustomParser().isValid(Uri.parse(tInvalidUrl)),
          throwsA(isA<ParseException>()),
        );
      });
    });

    group('recoverUser', () {
      test('A valid Medium Url should return the user', () {
        expect(
          const MediumParser().recoverUser(tValidUrl),
          tvalidUsername,
        );
      });

      test('A valid Medium Url should return the user', () {
        expect(
          const MediumParser().recoverUser(tValidUrl2),
          tvalidUsername2,
        );
      });

      test('An invalid Medium Url should throw a ParseException', () {
        expect(
          () => const MediumParser().recoverUser(tInvalidUrl),
          throwsA(const TypeMatcher<ParseException>()),
        );
      });
    });

    group('recreateUri', () {
      test('A valid Medium username should return the tValidUrl', () {
        expect(
          const MediumParser().recreateUri(tvalidUsername),
          tValidUrl2,
        );
      });

      test('A valid Medium username should return the tValidUrl', () {
        expect(
          const MediumParser().recreateUri(tvalidUsername2),
          tValidUrl2,
        );
      });
    });
  });
}
