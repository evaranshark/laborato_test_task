import 'package:get_it/get_it.dart';
import 'data/datasource/local_storage.dart';
import 'data/repositories/tasks_repository_impl.dart';
import 'domain/repositories/tasks_repository.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  final tasksSource = await TasksDataSourceImpl.init();
  locator.registerSingleton<TasksRepository>(
    TasksRepositoryImpl(
      tasksSource,
    ),
  );
}
