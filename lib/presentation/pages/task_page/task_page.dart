import 'package:flutter/material.dart';
import 'package:laborato_test_task/domain/entities/task.dart';

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
  const _AddTaskForm({
    super.key,
  });

  @override
  State<_AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<_AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Название',
                border: OutlineInputBorder(),
              ),
              controller: _nameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Описание',
                border: OutlineInputBorder(),
              ),
              controller: _descriptionController,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  TaskEntity(
                    name: _nameController.text,
                    description: _descriptionController.text,
                  ),
                );
              },
              child: Text(
                'Сохранить',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
