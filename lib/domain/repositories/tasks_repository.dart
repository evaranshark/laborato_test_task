import '../entities/task.dart';

abstract interface class TasksRepository {
  void dispose();
  Future<void> addTask(TaskEntity newTask);
  Future<void> removeTask(TaskEntity task);
  Future<List<TaskEntity>> fetch();
  Future<TaskEntity> getTask({
    required int id,
  });
}
