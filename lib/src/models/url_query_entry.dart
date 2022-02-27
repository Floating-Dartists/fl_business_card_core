import 'package:equatable/equatable.dart';

class UrlQueryEntry extends Equatable {
  final String key;
  final String value;

  const UrlQueryEntry({
    required this.key,
    required this.value,
  });

  @override
  List<Object?> get props => [key, value];
}
