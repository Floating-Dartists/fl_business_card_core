import 'package:fl_business_card_core/fl_business_card_core.dart'
    show CustomParser;
import 'package:fl_business_card_core/src/models/parse_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('CustomParser', () {
    const tValidUrl = 'https://twitter.com/ABC38_';
    const tInvalidUrl = 'htt.fsdfps://twittercom/status/ABC38_';

    const tvalidUsername = "twitter.com/ABC38_";
    const tInvalidUsername = "twittercom/status/ABC38_";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(const CustomParser().isValid(Uri.parse(tValidUrl)), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          () => const CustomParser().isValid(Uri.parse(tInvalidUrl)),
          // const CustomParser().isValid(Uri.parse(tInvalidUrl)),
          throwsA(isA<ParseException>()),
        );
      });
    });

    group('recoverUser', () {
      test('A valid custom URL should return the URL, minus the scheme', () {
        expect(
          const CustomParser().recoverUser(tValidUrl),
          tvalidUsername,
        );
      });

      test('An invalid custom URL should throw a ParseException', () {
        expect(
          () => const CustomParser().recoverUser(tInvalidUrl),
          throwsA(const TypeMatcher<ParseException>()),
        );
      });
    });

    group('recreateUri', () {
      test(
          'A valid custom URL "username" should return the URL, with the sceme',
          () {
        expect(
          const CustomParser().recreateUri(tvalidUsername),
          "https://twitter.com/ABC38_",
        );
      });
    });
  });
}
