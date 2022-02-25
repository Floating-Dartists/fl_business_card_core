import 'package:fl_business_card_core/fl_business_card_core.dart'
    show CustomParser;
import 'package:test/test.dart';

void main() {
  group('CustomParser', () {
    const parser = CustomParser();

    const tValidUrl = 'https://twitter.com/ABC38_';
    const tInvalidUrl = 'htt.fsdfps://twittercom/status/ABC38_';

    const tvalidUsername = "twitter.com/ABC38_";

    group('super constructor', () {
      test('should return a valid instance', () {
        expect(parser, isNotNull);
      });

      test('should return a valid instance', () {
        expect(parser, isA<CustomParser>());
      });

      test('should contain the right parameters', () {
        expect(parser.service, "Custom");
        expect(
          parser.hosts,
          const ["*"],
        );
        expect(parser.schemes, const ["https", "http", ""]);
        expect(parser.pathSegments, const []);
        expect(parser.queryParameters, const {});
      });
    });

    group('isValid', () {
      test('A valid URL should return true', () {
        expect(parser.isValid(tValidUrl), true);
      });

      test('An invalid URL should return false', () {
        expect(parser.isValid(tInvalidUrl), false);
      });
    });

    group('recoverUser', () {
      test('A valid custom URL should return the URL, minus the scheme', () {
        expect(parser.recoverUser(tValidUrl), tvalidUsername);
      });
    });

    group('recreateUri', () {
      test(
          'A valid custom URL "username" should return the URL, with the sceme',
          () {
        expect(
          parser.recreateUri(tvalidUsername),
          "https://twitter.com/ABC38_",
        );
      });
    });
  });
}
