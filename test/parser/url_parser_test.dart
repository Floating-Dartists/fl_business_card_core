import 'package:fl_business_card_core/fl_business_card_core.dart';
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
      test('2 objects with same props are equal', () {
        const a = MockParserA();
        const b = MockParserA();

        expect(a.props, equals(b.props));
        expect(a, equals(b));
      });
    });
  });
}
