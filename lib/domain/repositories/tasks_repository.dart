import 'package:laborato_test_task/domain/entities/task.dart';

abstract interface class TasksRepository {
  void dispose();
  void addTask(TaskEntity newTask);
  void removeTask(TaskEntity task);
  List<TaskEntity> getTasks();
}
