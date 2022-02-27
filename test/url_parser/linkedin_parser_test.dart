import 'package:fl_business_card_core/fl_business_card_core.dart'
    show LinkedInParser;
import 'package:test/test.dart';

void main() {
  group('LinkedInParser', () {
    const parser = LinkedInParser();

    const tValidUrl = 'https://linkedin.com/in/ABC38_';
    const tInvalidUrl = 'https://linkedincom/ABC38_';

    const tvalidUsername = "ABC38_";

    group('super constructor', () {
      test('should return a valid instance', () {
        expect(parser, isNotNull);
      });

      test('should return a valid instance', () {
        expect(parser, isA<LinkedInParser>());
      });

      test('should contain the right parameters', () {
        expect(parser.service, "LinkedIn");
        expect(
          parser.hosts,
          const ["linkedin.com", "www.linkedin.com"],
        );
        expect(parser.schemes, const ["https", "http", ""]);
        expect(parser.pathSegments, const ["in", "{user}"]);
        expect(parser.queryParameters, const {});
      });
    });

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
