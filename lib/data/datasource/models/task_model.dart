import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String description;
}
