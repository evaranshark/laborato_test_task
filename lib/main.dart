import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:laborato_test_task/data/datasource/models/task_model.dart';
import 'package:laborato_test_task/presentation/pages/task_page/task_page.dart';
import 'package:path_provider/path_provider.dart';

import 'locator.dart';
import 'presentation/pages/main_page/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laborato',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/task': (_) => const TaskPage(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Future<void> initServices() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter<TaskModel>(
    TaskModelAdapter(),
  );
  await setup();
}
