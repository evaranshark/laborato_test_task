part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

final class TaskError extends TaskState {
  const TaskError({
    required this.error,
  });

  final Exception? error;
}

final class TaskData extends TaskState {
  const TaskData({
    required this.data,
  });

  final TaskEntity data;
}

final class TaskLoading extends TaskState {}
