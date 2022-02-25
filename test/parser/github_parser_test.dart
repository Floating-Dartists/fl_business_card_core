import 'package:fl_business_card_core/fl_business_card_core.dart'
    show GithubParser;
import 'package:fl_business_card_core/src/models/parse_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('GithubParser', () {
    const tValidUrl = 'https://github.com/ABC38_';
    const tInvalidUrl = 'https://githubcom/status/ABC38_';

    const tvalidUsername = "ABC38_";

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(const GithubParser().isValid(Uri.parse(tValidUrl)), true);
      });

      test('An invalid URL should throw a ParseException', () {
        expect(
          () => const GithubParser().isValid(Uri.parse(tInvalidUrl)),
          // const CustomParser().isValid(Uri.parse(tInvalidUrl)),
          throwsA(isA<ParseException>()),
        );
      });
    });

    group('recoverUser', () {
      test('A valid Github Url should return the user', () {
        expect(
          const GithubParser().recoverUser(tValidUrl),
          tvalidUsername,
        );
      });

      test('An invalid Github Url should throw a ParseException', () {
        expect(
          () => const GithubParser().recoverUser(tInvalidUrl),
          throwsA(const TypeMatcher<ParseException>()),
        );
      });
    });

    group('recreateUri', () {
      test('A valid Github username should return the tValidUrl', () {
        expect(
          const GithubParser().recreateUri(tvalidUsername),
          tValidUrl,
        );
      });
    });
  });
}
