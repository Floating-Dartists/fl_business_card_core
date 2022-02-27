import 'package:fl_business_card_core/src/url_generator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('UrlGenerator', () {
    group('github', () {
      const generator = UrlGenerator.github;
      const tUrl = 'https://github.com/ABC38_';
      const tQuery = <String, String>{'gh': 'ABC38_'};

      test('should generate a github query parameter', () {
        expect(
          {generator.queryKey: generator.urlParser.recoverUser(tUrl)},
          tQuery,
        );
      });
    });
  });
}
