import 'package:laborato_test_task/domain/entities/task.dart';
import 'package:laborato_test_task/domain/repositories/tasks_repository.dart';

import '../../domain/tasks_datasource.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TasksDataSource _source;
  TasksRepositoryImpl(TasksDataSource source) : _source = source;

  @override
  void dispose() {
    _source.dispose();
  }

  @override
  void addTask(TaskEntity newTask) {
    _source.addTask(newTask);
  }

  @override
  List<TaskEntity> getTasks() {
    final tasks = _source.getTasks();
    return tasks
        .map(
          (e) => TaskEntity(
            name: e.name,
            description: e.description,
            id: e.key,
          ),
        )
        .toList();
  }

  @override
  void removeTask(TaskEntity task) {
    _source.removeTask(task);
  }
}
