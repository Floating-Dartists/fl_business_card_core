import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'url_parse_exceptions.dart';

export 'url_parser/custom_parser.dart';
export 'url_parser/github_parser.dart';
export 'url_parser/gitlab_parser.dart';
export 'url_parser/linkedin_parser.dart';
export 'url_parser/medium_parser.dart';
export 'url_parser/stack_overflow_parser.dart';
export 'url_parser/twitter_parser.dart';

abstract class UrlParser extends Equatable {
  const UrlParser({
    required this.service,
    this.schemes = const ["https", "http", ""],
    required this.hosts,
    this.pathSegments = const [],
    this.queryParameters = const {},
  });

  /// Name of the service the parser is for.
  ///
  /// Will be used in Exceptions, notably.
  final String service;

  /// The list of valid URL schemes for this service.
  ///
  /// As a rule of thumb, the first element of the list
  /// should be the most commonly used one, as it will
  /// be used to create the final URL with [recreateUri()]
  /// (aka `https` in most cases).
  ///
  /// For HTTP(S) schemes, it should also contain the empty string.
  final List<String> schemes; // ["https", "http", ""];

  /// The list of valid URL hosts for this service.
  ///
  /// As a rule of thumb, the first element of the list
  /// should be the most commonly used one, as it will
  /// be used to create the final URL with [recreateUri()].
  ///
  /// In the case the username can be part of the host, the second
  /// host should be the apex host, so we can check again.
  final List<String> hosts;

  /// A list of the pathSegments that will be used in the URI.
  ///
  /// If a path segment should be replaced with the username,
  /// it should be called `{user}` in the list.
  ///
  /// The list shouldn't be used if it's empty.
  final List<String> pathSegments; //[];

  //TODO: Should we add support for fragments (#id) out of the box ?

  /// A list of the queryParameters that will be used in the URI.
  ///
  /// If a query parameter should be replaced with the username,
  /// it should be called `{user}` in the map.
  ///
  /// The map shouldn't be used if it's empty.
  final Map<String, String> queryParameters; // => {};

  @override
  List<Object?> get props => [
        service,
        schemes,
        hosts,
        pathSegments,
        queryParameters,
      ];

  // List<String> replaceUserInPathSegments(String user) {
  //   return pathSegments
  //       .map((segment) => segment.replaceAll('{user}', user))
  //       .toList();
  // }

  String replaceUserInHost(String user) {
    return hosts.first.replaceAll('{user}', user);
  }

  List<String> replaceUserInPathSegments(String user) {
    final replacedPathSegments = pathSegments.toList();
    for (int i = 0; i < replacedPathSegments.length; i++) {
      replacedPathSegments[i] =
          replacedPathSegments[i].replaceAll('{user}', user);
    }
    return replacedPathSegments;
  }

  Map<String, String> replaceUserInQueryParameters(String user) {
    final replacedQueryParameters = queryParameters;
    for (int i = 0; i < replacedQueryParameters.length; i++) {
      replacedQueryParameters[replacedQueryParameters.keys.elementAt(i)] =
          replacedQueryParameters[replacedQueryParameters.keys.elementAt(i)]!
              .replaceAll('{user}', user);
    }
    return replacedQueryParameters;
    // return queryParameters
    //     .map((key, value) => MapEntry(key, value.replaceAll('{user}', user)));
  }

  bool isValid(Uri uri) => isValidUrl(uri) == null;

  @mustCallSuper
  String? isValidUrl(Uri uri) {
    if (!schemes.contains(uri.scheme)) {
      return "The scheme of ${uri.toString()} is not accepted for this service.";
    }
    if (hosts[0] != "*" && !hosts.contains(uri.host)) {
      /// If it comes to this, we must still account for the case where the
      /// username IS *part* of the host, such as for some Medium users.
      if (hosts[0].contains("{user}") &&
          (hosts.length < 2 || !uri.host.contains(hosts[0]))) {
        return "The host of ${uri.toString()} is not accepted for this service.";
      }
    }
    return null;
  }

  String recoverUser(String uriString) {
    final uri = Uri.tryParse(uriString);
    if (uri == null || !isValid(uri)) {
      return uriString;
    }
    final indexInPathSegment =
        pathSegments.indexWhere((element) => element == '{user}');
    if (indexInPathSegment != -1 &&
        uri.pathSegments.length > indexInPathSegment) {
      return uri.pathSegments[indexInPathSegment];
    }
    final indexInQuery = List<String>.from(queryParameters.values)
        .indexWhere((element) => element == '{user}');
    if (indexInQuery != -1 && uri.queryParameters.length > indexInQuery) {
      return uri.queryParameters.values.toList()[indexInQuery];
    }
    if (hosts.length >= 2 && hosts[1].contains("{user}")) {
      return uri.host.split(".").first;
    }
    throw UrlParseException(
      parseType: service,
      message: "Couldn't find user in URI",
    );
  }

  String recreateUri(String user) {
    final uri = Uri(
      scheme: schemes.first,
      host: replaceUserInHost(hosts.first),
      pathSegments:
          pathSegments.isNotEmpty ? replaceUserInPathSegments(user) : null,
      queryParameters: queryParameters.isNotEmpty
          ? replaceUserInQueryParameters(user)
          : null,
    );
    return uri.toString();
  }
}
