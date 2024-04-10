import '../data/datasource/models/task_model.dart';
import 'datasource.dart';
import 'entities/task.dart';

abstract class TasksDataSource implements DataSource {
  Future<void> addTask(TaskEntity task);
  Future<void> removeTask(TaskEntity task);
  Future<List<TaskModel>> getTasks();
  Future<TaskModel?> getTask(int id);
}
