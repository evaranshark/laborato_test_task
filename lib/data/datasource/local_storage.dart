import 'package:hive/hive.dart';
import 'package:laborato_test_task/data/datasource/models/task_model.dart';
import 'package:laborato_test_task/domain/entities/task.dart';
import 'package:laborato_test_task/domain/tasks_datasource.dart';

class TasksDataSourceImpl implements TasksDataSource {
  late final Box<TaskModel> _tasksBox;
  TasksDataSourceImpl._();
  static final instance = TasksDataSourceImpl._();

  @override
  void dispose() {
    _tasksBox.close();
  }

  static Future<TasksDataSourceImpl> init() async {
    instance._tasksBox = await Hive.openBox<TaskModel>('tasks');
    return instance;
  }

  @override
  void addTask(TaskEntity task) {
    _tasksBox.add(
      TaskModel()
        ..name = task.name
        ..description = task.description,
    );
  }

  @override
  List<TaskModel> getTasks() {
    return _tasksBox.values.toList();
  }

  @override
  void removeTask(TaskEntity task) {
    _tasksBox.delete(task.id!);
  }
}
