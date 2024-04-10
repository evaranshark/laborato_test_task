import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/tasks_repository.dart';
import '../../../locator.dart';
import 'cubit/task_cubit.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskCubit(
        locator.get<TasksRepository>(),
      )..getTaskById(id),
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Ошибка',
              ),
            ),
          );
          debugPrint((state as TaskError).error.toString());
        },
        listenWhen: (previous, current) => current is TaskError,
        builder: (context, state) {
          if (state is TaskData) {
            final task = state.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    task.name,
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
