import 'package:equatable/equatable.dart';

import '../fl_business_card_core.dart';
import 'models/url_query_entry.dart';

const _kGenerators = <UrlGenerator>[
  UrlGenerator.github,
  UrlGenerator.gitlab,
];

class UrlGenerator extends Equatable {
  final String queryKey;
  final UrlParser urlParser;

  const UrlGenerator._({required this.queryKey, required this.urlParser});

  factory UrlGenerator.fromUrl(String url, {UrlGenerator Function()? orElse}) {
    final parser = GlobalParser.getParser(url);
    if (parser == null) {
      if (orElse != null) {
        return orElse();
      }
      throw ArgumentError('No parser found for $url');
    }
    return UrlGenerator.fromParser(parser, orElse: orElse);
  }

  factory UrlGenerator.fromParser(
    UrlParser parser, {
    UrlGenerator Function()? orElse,
  }) =>
      _kGenerators.firstWhere((e) => e.urlParser == parser, orElse: orElse);

  static const github = UrlGenerator._(
    queryKey: 'gh',
    urlParser: GithubParser(),
  );

  static const gitlab = UrlGenerator._(
    queryKey: 'gl',
    urlParser: GitlabParser(),
  );

  // other generators can be added here...

  UrlQueryEntry getQueryEntry(String url) => UrlQueryEntry(
        key: queryKey,
        value: urlParser.recoverUser(url),
      );

  @override
  List<Object?> get props => [queryKey, urlParser];
}
