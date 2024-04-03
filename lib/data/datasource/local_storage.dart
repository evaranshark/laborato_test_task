import 'package:hive/hive.dart';

import '../../domain/entities/task.dart';
import '../../domain/tasks_datasource.dart';
import 'converters/task_converter.dart';
import 'models/task_model.dart';

class TasksDataSourceImpl implements TasksDataSource {
  TasksDataSourceImpl._();
  late final Box<TaskModel> _tasksBox;
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
  Future<void> addTask(TaskEntity task) async {
    await _tasksBox.add(
      TaskConverter().toModel(task),
    );
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    return _tasksBox.values.toList();
  }

  @override
  Future<void> removeTask(TaskEntity task) async {
    await _tasksBox.delete(task.id!);
  }
}
