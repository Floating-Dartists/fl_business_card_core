import 'dart:math' as math;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

String getRandomString(int length) {
  final random = math.Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => _chars.codeUnitAt(random.nextInt(_chars.length)),
    ),
  );
}
