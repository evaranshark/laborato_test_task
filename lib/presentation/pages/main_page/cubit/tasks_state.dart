part of 'tasks_cubit.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

final class TasksInitial extends TasksState {}

final class TasksHasData extends TasksState {
  final List<TaskEntity> tasks;

  const TasksHasData({
    required this.tasks,
  });
}

final class TasksNoData extends TasksState {}

final class TasksUpdated extends TasksState {}

final class TasksFetching extends TasksState {}
