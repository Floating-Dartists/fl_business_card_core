import 'package:fl_business_card_core/fl_business_card_core.dart';
import 'package:fl_business_card_core/src/models/url_parse_exceptions.dart';
import 'package:test/test.dart';

const _tService = 'a';
const _tHosts = ['a.com', 'a.net'];

class MockParserA extends UrlParser {
  const MockParserA() : super(service: _tService, hosts: _tHosts);
}

class MockParserB extends UrlParser {
  const MockParserB() : super(service: _tService, hosts: _tHosts);
}

void main() {
  group('UrlParser', () {
    group('props', () {
      const tParserA = MockParserA();
      const tParserB = MockParserA();

      test('2 objects with same props are equal', () {
        expect(tParserA.props, equals(tParserB.props));
        expect(tParserA, equals(tParserB));
      });
    });

    group('recoverUser', () {
      const tParser = MockParserA();
      const tUriString = '';

      test('throws a UrlParseException if no valid url is found', () {
        expect(
          () => tParser.recoverUser(tUriString),
          throwsA(isA<UrlParseException>()),
        );
      });
    });
  });
}
