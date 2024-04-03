import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late TaskTypeModel type;
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
