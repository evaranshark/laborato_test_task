import 'package:equatable/equatable.dart';

class TaskEntity with EquatableMixin {
  final String name;
  final String description;
  final int? id;

  TaskEntity({
    required this.name,
    required this.description,
    this.id,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        id,
      ];
}
