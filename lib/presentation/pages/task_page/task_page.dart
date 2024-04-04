import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новое упражнение'),
      ),
      body: const _AddTaskForm(),
    );
  }
}

class _AddTaskForm extends StatefulWidget {
  const _AddTaskForm();

  @override
  State<_AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<_AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskType? _type;
  Difficulty? _difficulty;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Название',
              ),
              controller: _nameController,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Описание',
              ),
              controller: _descriptionController,
            ),
            const SizedBox(
              height: 10.0,
            ),
            DropdownButtonFormField<TaskType>(
              hint: const Text('Тип упражнения'),
              items: const [
                DropdownMenuItem(
                  value: TaskType.cardio,
                  child: Text('Кардио'),
                ),
                DropdownMenuItem(
                  value: TaskType.balance,
                  child: Text('Баланс'),
                ),
                DropdownMenuItem(
                  value: TaskType.strength,
                  child: Text('Силовые'),
                ),
                DropdownMenuItem(
                  value: TaskType.flexibility,
                  child: Text('Растяжка'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _type = value;
                });
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            DropdownButtonFormField<Difficulty>(
              hint: const Text('Сложность'),
              items: const [
                DropdownMenuItem(
                  value: Difficulty.easy,
                  child: Text('Низкая'),
                ),
                DropdownMenuItem(
                  value: Difficulty.medium,
                  child: Text('Средняя'),
                ),
                DropdownMenuItem(
                  value: Difficulty.hard,
                  child: Text('Высокая'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _difficulty = value;
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final result = TaskEntity(
                    name: _nameController.text,
                    description: _descriptionController.text,
                    type: _type!,
                    difficulty: _difficulty!);
                Navigator.of(context).pop(
                  result,
                );
              },
              child: const Center(
                child: Text(
                  'Сохранить',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
