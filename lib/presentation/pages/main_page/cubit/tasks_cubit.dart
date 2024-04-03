import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/task.dart';

import '../../../../domain/repositories/tasks_repository.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit({
    required TasksRepository repository,
  })  : _repo = repository,
        super(TasksInitial());
  final TasksRepository _repo;

  Future<void> addItem(TaskEntity newTask) async {
    await _repo.addTask(newTask);
    emit(TasksUpdated());
  }

  Future<void> fetch() async {
    emit(TasksFetching());
    final tasks = await _repo.fetch();
    if (tasks.isEmpty) {
      emit(TasksNoData());
    } else {
      emit(
        TasksHasData(tasks: tasks),
      );
    }
  }

  Future<void> removeItem(TaskEntity entity) async {
    await _repo.removeTask(entity);
    emit(TasksUpdated());
  }
}
