import 'package:hive/hive.dart';

part 'exercise_duration_model.g.dart';

@HiveType(typeId: 3)
class ExerciseDurationModel extends HiveObject {
  @HiveField(0)
  late int value;
  @HiveField(1)
  late DurationUnitModel units;
}

@HiveType(typeId: 4)
enum DurationUnitModel {
  @HiveField(0)
  sec,
  @HiveField(1)
  min,
}
