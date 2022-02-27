import 'package:fl_business_card_core/src/models/url_query_entry.dart';
import 'package:fl_business_card_core/src/url_generator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('UrlGenerator', () {
    group('github', () {
      const generator = UrlGenerator.github;
      const tUrl = 'https://github.com/ABC38_';
      const tQuery = UrlQueryEntry(key: 'gh', value: 'ABC38_');

      test('getQueryEntry', () {
        expect(generator.getQueryEntry(tUrl), tQuery);
      });
    });
  });
}
