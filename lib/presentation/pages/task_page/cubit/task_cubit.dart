import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/exceptions/entity_not_found_exception.dart';
import '../../../../domain/entities/task.dart';
import '../../../../domain/repositories/tasks_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(TasksRepository repository)
      : _repo = repository,
        super(TaskInitial());

  final TasksRepository _repo;

  Future<void> getTaskById(int id) async {
    try {
      final task = await _repo.getTask(id: id);
      emit(TaskData(data: task));
    } on EntityNotFoundException catch (e) {
      emit(TaskError(error: e));
    }
  }
}
