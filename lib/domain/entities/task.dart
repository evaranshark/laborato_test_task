import 'package:equatable/equatable.dart';

class TaskEntity with EquatableMixin {
  TaskEntity({
    required this.name,
    required this.description,
    required this.type,
    this.id,
  });
  final String name;
  final String description;
  final TaskType type;
  final dynamic id;

  @override
  List<Object?> get props => [
        name,
        description,
        id,
      ];
}

enum TaskType {
  cardio,
  strength,
  balance,
  flexibility,
}
