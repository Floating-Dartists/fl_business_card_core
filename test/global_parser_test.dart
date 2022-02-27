import 'package:fl_business_card_core/fl_business_card_core.dart';
import 'package:test/test.dart';

const _tHosts = [
  'facebook.com',
  'www.facebook.com',
];

class MockFacebookParser extends UrlParser {
  const MockFacebookParser() : super(service: 'Facebook', hosts: _tHosts);
}

void main() {
  tearDown(GlobalParser.restoreParsers);

  group('GlobalParser', () {
    group('addParser', () {
      const tMockparser = MockFacebookParser();
      const tUrl = 'https://www.facebook.com/random';

      test('should add a parser tMockparser', () {
        // arrange
        GlobalParser.removeParser(const CustomParser());
        expect(GlobalParser.getParser(tUrl), isNull);

        // act
        GlobalParser.addParser(tMockparser);

        // assert
        expect(GlobalParser.getParser(tUrl), tMockparser);
      });
    });

    group('addParsers', () {
      const tUrlA = 'https://github.com/TesteurManiak';
      const tUrlB = 'https://gitlab.com/G_Roux';

      test('should add GithubParser and GitlabParser', () {
        // arrange
        GlobalParser.removeParsers([
          const CustomParser(),
          const GithubParser(),
          const GitlabParser(),
        ]);
        expect(GlobalParser.getParser(tUrlA), isNull);
        expect(GlobalParser.getParser(tUrlB), isNull);

        // act
        GlobalParser.addParsers([
          const GithubParser(),
          const GitlabParser(),
        ]);

        // assert
        expect(GlobalParser.getParser(tUrlA), isNotNull);
        expect(GlobalParser.getParser(tUrlB), isNotNull);
      });
    });

    group('removeParser', () {
      const tUrl = '';

      test('should remove parser CustomParser', () {
        // arrange
        expect(GlobalParser.getParser(tUrl), isNotNull);

        // act
        GlobalParser.removeParser(const CustomParser());

        // assert
        expect(GlobalParser.getParser(tUrl), isNull);
      });
    });

    group('removeParsers', () {
      const tUrlA = 'https://github.com/TesteurManiak';
      const tUrlB = 'https://gitlab.com/G_Roux';

      test('should remove parsers CustomParser, GithubParser and GitlabParser',
          () {
        // arrange
        expect(GlobalParser.getParser(tUrlA), isNotNull);
        expect(GlobalParser.getParser(tUrlB), isNotNull);

        // act
        GlobalParser.removeParsers([
          const CustomParser(),
          const GithubParser(),
          const GitlabParser(),
        ]);

        // assert
        expect(GlobalParser.getParser(tUrlA), isNull);
        expect(GlobalParser.getParser(tUrlB), isNull);
      });
    });

    group('isValid', () {
      const tValidUrl = 'https://github.com/TesteurManiak';

      test('should return true with a GitHub url', () {
        expect(GlobalParser.isValid(tValidUrl), true);
      });
    });

    group('getParser', () {
      const tGitHubUrl = 'https://github.com/TesteurManiak';

      test('should return existing GithubParser', () {
        expect(GlobalParser.getParser(tGitHubUrl), isNotNull);
      });

      test('should return null for non existing parser', () {
        // arrange
        GlobalParser.removeParsers([
          const CustomParser(),
          const GithubParser(),
        ]);

        // assert
        expect(GlobalParser.getParser(tGitHubUrl), isNull);
      });
    });
  });
}
