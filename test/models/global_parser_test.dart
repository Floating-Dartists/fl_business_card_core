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
  group('GlobalParser', () {
    group('addParser', () {
      const tMockparser = MockFacebookParser();
      const tUrl = 'https://www.facebook.com/random';

      test('should add a parser', () {
        // arrange
        GlobalParser.removeParser(const CustomParser());

        expect(GlobalParser.getParser(tUrl), isNull);
        GlobalParser.addParser(tMockparser);
        expect(GlobalParser.getParser(tUrl), tMockparser);
      });
    });
  });
}
