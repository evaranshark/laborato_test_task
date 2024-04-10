import 'package:flutter/material.dart';

import '../../../../domain/entities/exercise_duration.dart';
import '../../../../domain/entities/task.dart';
import '../../task_page/task_arguments.dart';

class ExerciseListItem extends StatelessWidget {
  const ExerciseListItem({
    super.key,
    required this.item,
  });

  final TaskEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/task',
            arguments: TaskArguments(
              id: item.id!,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _Name(
                      name: item.name,
                    ),
                  ),
                  _Type(type: item.type),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              ValueField(
                title: 'Сложность',
                value: getExerciseDifficultyName(
                  context,
                  item.difficulty,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ValueField(
                title: 'Продолжительность',
                value: buildDurationString(item.duration),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String buildDurationString(ExerciseDuration duration) {
  final unit = switch (duration.units) {
    DurationUnit.min => 'мин',
    DurationUnit.sec => 'сек',
  };
  return '${duration.value} $unit';
}

///Takes [context] for future localization
String getExerciseDifficultyName(BuildContext context, Difficulty diff) =>
    switch (diff) {
      Difficulty.easy => 'Низкая',
      Difficulty.medium => 'Средняя',
      Difficulty.hard => 'Высокая',
    };

class _Type extends StatelessWidget {
  const _Type({
    required this.type,
  });

  final TaskType type;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: getTypeColor(type),
      label: Text(
        getExerciseTypeName(
          context,
          type,
        ),
      ),
    );
  }

  ///Takes [context] for future localization
  String getExerciseTypeName(BuildContext context, TaskType type) =>
      switch (type) {
        TaskType.cardio => 'Кардио',
        TaskType.balance => 'Баланс',
        TaskType.strength => 'Силовые',
        TaskType.flexibility => 'Растяжка',
      };
  Color getTypeColor(TaskType type) => switch (type) {
        TaskType.cardio => Colors.green.shade200,
        TaskType.balance => Colors.indigo.shade200,
        TaskType.strength => Colors.blueGrey.shade200,
        TaskType.flexibility => Colors.lime.shade200,
      };
}

class _Name extends StatelessWidget {
  const _Name({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: null,
      name,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class ValueField extends StatelessWidget {
  const ValueField({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
