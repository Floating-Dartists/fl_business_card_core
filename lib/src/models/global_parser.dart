import 'package:collection/collection.dart';
import 'url_parser/url_parser.dart';

class GlobalParser {
  GlobalParser._();

  final _parsers = <UrlParser>[
    const CustomParser(),
    const GithubParser(),
    const GitlabParser(),
    const LinkedInParser(),
    const MediumParser(),
    const StackOverflowParser(),
    const TwitterParser(),
  ];

  static final _instance = GlobalParser._();

  /// Add a [parser] to the list of parsers.
  static void addParser(UrlParser parser) => _instance._parsers.add(parser);

  /// Add multiple [parsers] to the list of parsers.
  static void addParsers(Iterable<UrlParser> parsers) =>
      _instance._parsers.addAll(parsers);

  /// Remove [parser] from the list of parsers.
  static bool removeParser(UrlParser parser) =>
      _instance._parsers.remove(parser);

  static bool isValid(String url) =>
      _instance._parsers.any((parser) => parser.isValid(url));

  /// Return the [UrlParser] that matches the given [url].
  static UrlParser? getParser(String url) =>
      _instance._parsers.firstWhereOrNull((parser) => parser.isValid(url));
}
