import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laborato_test_task/domain/entities/task.dart';

import '../../../../domain/repositories/tasks_repository.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepository _repo;
  TasksCubit({
    required TasksRepository repository,
  })  : _repo = repository,
        super(TasksInitial());

  void addItem(TaskEntity newTask) {
    _repo.addTask(newTask);
    emit(TasksUpdated());
  }

  void fetch() {
    emit(TasksFetching());
    final tasks = _repo.getTasks();
    if (tasks.isEmpty) {
      emit(TasksNoData());
    } else {
      emit(
        TasksHasData(tasks: tasks),
      );
    }
  }

  void removeItem(TaskEntity entity) {
    _repo.removeTask(entity);
    emit(TasksUpdated());
  }
}
