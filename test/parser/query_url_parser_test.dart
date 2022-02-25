import 'package:fl_business_card_core/fl_business_card_core.dart'
    show UrlParser;
import 'package:test/test.dart';

class YouTubeVideoParser extends UrlParser {
  const YouTubeVideoParser()
      : super(
          service: "YouTube",
          hosts: const [
            'youtube.com',
            'youtu.be',
            'www.youtube.com',
            'www.youtu.be'
          ],
          pathSegments: const ['watch'],
          queryParameters: const {'v': '{user}'},
        );

  @override
  String? isValidUrl(String uriString) {
    final uri = Uri.parse(uriString);
    final path = uri.pathSegments;
    if (!(path.length == 1 && path[0] == pathSegments[0])) {
      return "Wrong segment";
    }
    return super.isValidUrl(uriString);
  }
}

void main() {
  group('YouTubeVideoParser', () {
    const parser = YouTubeVideoParser();

    const tValidUrl = 'https://youtube.com/watch?v=dQw4w9WgXcQ';
    const tValidUrl2 =
        'https://www.youtube.com/watch?v=d7NcxXuk3cw&list=PLWXWbr9ex3iVqtmHSJ0OIeEnD2hOZnp2Q&index=36';
    const tInvalidUrl = 'https://www.youtube.com/blep?d=dQw4w9WgXc';

    const tvalidUsername = "dQw4w9WgXcQ";
    const tvalidUsername2 = "d7NcxXuk3cw";

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
      test('A valid YouTube Video Url should return the user', () {
        expect(
          parser.recoverUser(tValidUrl),
          tvalidUsername,
        );
      });
    });

    test('A valid YouTube Video Url should return the user', () {
      expect(
        parser.recoverUser(tValidUrl2),
        tvalidUsername2,
      );
    });

    group('recreateUri', () {
      test('A valid YouTube Video username should return the tValidUrl', () {
        expect(
          parser.recreateUri(tvalidUsername),
          tValidUrl,
        );
      });
    });
  });
}
