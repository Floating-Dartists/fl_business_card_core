import 'package:equatable/equatable.dart';

import '../fl_business_card_core.dart';

const _kGenerators = <UrlGenerator>[
  UrlGenerator.github,
  UrlGenerator.gitlab,
];

class UrlGenerator extends Equatable {
  final String queryKey;
  final UrlParser urlParser;

  const UrlGenerator._({required this.queryKey, required this.urlParser});

  factory UrlGenerator.customUrl({
    required String queryKey,
  }) =>
      UrlGenerator._(
        queryKey: queryKey,
        urlParser: const CustomParser(),
      );

  factory UrlGenerator.fromParser(UrlParser parser) => _kGenerators.firstWhere(
        (e) => e.urlParser == parser,
        orElse: () => UrlGenerator.customUrl(queryKey: 'c'),
      );

  static const github = UrlGenerator._(
    queryKey: 'gh',
    urlParser: GithubParser(),
  );

  static const gitlab = UrlGenerator._(
    queryKey: 'gl',
    urlParser: GitlabParser(),
  );

  // other generators can be added here...

  @override
  List<Object?> get props => [queryKey, urlParser];
}
