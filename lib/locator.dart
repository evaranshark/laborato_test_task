import 'package:get_it/get_it.dart';
import 'package:laborato_test_task/data/datasource/local_storage.dart';
import 'package:laborato_test_task/data/repositories/tasks_repository_impl.dart';
import 'package:laborato_test_task/domain/repositories/tasks_repository.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  final tasksSource = await TasksDataSourceImpl.init();
  locator.registerSingleton<TasksRepository>(
    TasksRepositoryImpl(
      tasksSource,
    ),
  );
}
