import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborato_test_task/domain/entities/task.dart';
import 'package:laborato_test_task/domain/repositories/tasks_repository.dart';
import 'package:laborato_test_task/presentation/pages/main_page/cubit/tasks_cubit.dart';
import 'package:laborato_test_task/presentation/pages/task_page/task_page.dart';

import '../../../locator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(BuildContext context) {
    setState(() {
      _counter++;
      context.read<TasksCubit>().addItem(
            TaskEntity(
              name: 'name $_counter',
              description: 'description $_counter',
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(
        repository: locator.get<TasksRepository>(),
      )..fetch(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: RefreshIndicator.adaptive(
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
                              child: Card(
                                child: Column(
                                  children: [
                                    Text(
                                      item.name,
                                    ),
                                    Text(
                                      item.description,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: state.tasks.length,
                        );
                      }
                      return const SliverFillRemaining(
                        child: Text('No tasks'),
                      );
                    }),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await showAdaptiveDialog<TaskEntity>(
                context: context,
                builder: (context) => const Dialog.fullscreen(
                  child: TaskPage(),
                ),
              );
              if (!context.mounted) return;
              if (result != null) {
                context.read<TasksCubit>().addItem(result);
              }
            },
            tooltip: 'Новое упражнение',
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
