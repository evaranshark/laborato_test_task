import 'package:equatable/equatable.dart';

import 'exercise_duration.dart';

class TaskEntity with EquatableMixin {
  TaskEntity({
    required this.name,
    required this.description,
    required this.type,
    required this.duration,
    this.difficulty = Difficulty.medium,
    this.id,
  });
  final String name;
  final String description;
  final TaskType type;
  final dynamic id;
  final Difficulty difficulty;
  final ExerciseDuration duration;

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

enum Difficulty {
  easy,
  medium,
  hard,
}
