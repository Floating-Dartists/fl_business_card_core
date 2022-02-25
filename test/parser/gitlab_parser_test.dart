import 'package:fl_business_card_core/fl_business_card_core.dart'
    show GitlabParser;
import 'package:test/test.dart';

void main() {
  group('GitlabParser', () {
    const parser = GitlabParser();

    const tValidUrl = 'https://gitlab.com/ABC38_';
    const tInvalidUrl = 'https://gitlabcom/status/ABC38_';

    const tvalidUsername = "ABC38_";

    group('super constructor', () {
      test('should return a valid instance', () {
        expect(parser, isNotNull);
      });

      test('should return a valid instance', () {
        expect(parser, isA<GitlabParser>());
      });

      test('should contain the right parameters', () {
        expect(parser.service, "GitLab");
        expect(
          parser.hosts,
          const ["gitlab.com", "www.gitlab.com"],
        );
        expect(parser.schemes, const ["https", "http", ""]);
        expect(parser.pathSegments, const ["{user}"]);
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
      test('A valid Gitlab Url should return the user', () {
        expect(parser.recoverUser(tValidUrl), tvalidUsername);
      });
    });

    group('recreateUri', () {
      test('A valid Gitlab username should return the tValidUrl', () {
        expect(parser.recreateUri(tvalidUsername), tValidUrl);
      });
    });
  });
}
