import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/task.dart';
import '../../../domain/repositories/tasks_repository.dart';
import '../../../locator.dart';
import '../task_page/edit_task_page.dart';
import 'cubit/tasks_cubit.dart';
import 'widgets/exercise_list_item.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(
        repository: locator.get<TasksRepository>(),
      )..fetch(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
            ),
            body: const _Content(),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await showAdaptiveDialog<TaskEntity>(
                  context: context,
                  builder: (context) => const Dialog.fullscreen(
                    child: EditTaskPage(),
                  ),
                );
                if (!context.mounted) return;
                if (result != null) {
                  await context.read<TasksCubit>().addItem(result);
                }
              },
              tooltip: 'Новое упражнение',
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async => context.read<TasksCubit>().fetch(),
      child: CustomScrollView(
        slivers: [
          BlocConsumer<TasksCubit, TasksState>(
            listener: (context, state) {
              context.read<TasksCubit>().fetch();
            },
            listenWhen: (previous, current) => current is TasksUpdated,
            buildWhen: (previous, current) {
              return current is TasksNoData || current is TasksHasData;
            },
            builder: (context, state) {
              if (state is TasksHasData) {
                return SliverList.builder(
                  itemBuilder: (context, index) {
                    final item = state.tasks[index];
                    return Dismissible(
                      key: Key(item.id!.toString()),
                      onDismissed: (direction) {
                        context.read<TasksCubit>().removeItem(item);
                      },
                      child: ExerciseListItem(item: item),
                    );
                  },
                  itemCount: state.tasks.length,
                );
              }
              return const SliverFillRemaining(
                child: Center(
                  child: Text('Упражнений нет'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
