import 'package:equatable/equatable.dart';

abstract class UrlPattern extends Equatable {
  const UrlPattern();

  String get host;

  @override
  List<Object?> get props => [host];
}
