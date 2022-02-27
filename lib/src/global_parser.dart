import 'package:collection/collection.dart' show IterableExtension;
import 'package:meta/meta.dart';
import 'url_parser/url_parser.dart';

const _defaultParsers = [
  CustomParser(),
  GithubParser(),
  GitlabParser(),
  LinkedInParser(),
  MediumParser(),
  StackOverflowParser(),
  TwitterParser(),
];

class GlobalParser {
  GlobalParser._();

  final _parsers = <UrlParser>[..._defaultParsers];

  static final _instance = GlobalParser._();

  /// Add a [parser] to the list of parsers.
  static void addParser(UrlParser parser) => _instance._parsers.add(parser);

  /// Add multiple [parsers] to the list of parsers.
  static void addParsers(Iterable<UrlParser> parsers) =>
      _instance._parsers.addAll(parsers);

  /// Remove [parser] from the list of parsers.
  static bool removeParser(UrlParser parser) =>
      _instance._parsers.remove(parser);

  /// Remove multiple [parsers] from the list of parsers.
  static void removeParsers(Iterable<UrlParser> parsers) =>
      _instance._parsers.removeWhere((e) => parsers.contains(e));

  static bool isValid(String url) =>
      _instance._parsers.any((parser) => parser.isValid(url));

  /// Return the [UrlParser] that matches the given [url].
  static UrlParser? getParser(String url) =>
      _instance._parsers.firstWhereOrNull((parser) => parser.isValid(url));

  /// Reset the list of parsers to its default value.
  @visibleForTesting
  static void restoreParsers() {
    _instance._parsers
      ..clear()
      ..addAll(_defaultParsers);
  }
}
