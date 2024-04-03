import 'package:laborato_test_task/data/datasource/models/task_model.dart';
import 'package:laborato_test_task/domain/datasource.dart';
import 'package:laborato_test_task/domain/entities/task.dart';

abstract class TasksDataSource implements DataSource {
  void addTask(TaskEntity task);
  void removeTask(TaskEntity task);
  List<TaskModel> getTasks();
}
