import '../../domain/entities/exceptions/entity_not_found_exception.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/tasks_repository.dart';

import '../../domain/tasks_datasource.dart';
import '../datasource/converters/task_converter.dart';

class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl(TasksDataSource source) : _source = source;
  final TasksDataSource _source;
  Iterable<TaskEntity>? _tasks;

  @override
  void dispose() {
    _source.dispose();
  }

  @override
  Future<void> addTask(TaskEntity newTask) async {
    await _source.addTask(newTask);
  }

  @override
  Future<List<TaskEntity>> fetch() async {
    final taskModels = await _source.getTasks();
    final taskConverter = TaskConverter();
    _tasks = taskModels.map(
      (e) => taskConverter.fromModel(e),
    );
    return _tasks?.toList() ?? [];
  }

  @override
  Future<void> removeTask(TaskEntity task) async {
    return await _source.removeTask(task);
  }

  @override
  Future<TaskEntity> getTask({required id}) async {
    final taskModel = await _source.getTask(id);
    if (taskModel == null) {
      throw EntityNotFoundException(id: id);
    }
    return TaskConverter().fromModel(taskModel);
  }
}
