import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String auther;
  final String id;
  final String content;
  const Quote({
    required this.auther,
    required this.id,
    required this.content,
  });

  @override
  List<Object?> get props => [auther, id, content];
}
