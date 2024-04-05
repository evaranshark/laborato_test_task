import 'package:hive/hive.dart';

import 'exercise_duration_model.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late TaskTypeModel type;
  @HiveField(3)
  late DifficultyModel difficulty;
  @HiveField(4)
  late ExerciseDurationModel duration;
}

@HiveType(typeId: 1)
enum TaskTypeModel {
  @HiveField(0)
  cardio,
  @HiveField(1)
  strength,
  @HiveField(2)
  balance,
  @HiveField(3)
  flexibility,
}

@HiveType(typeId: 2)
enum DifficultyModel {
  @HiveField(0)
  easy,
  @HiveField(1)
  medium,
  @HiveField(2)
  hard,
}
