import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'data/datasource/models/task_model.dart';
import 'locator.dart';
import 'presentation/pages/main_page/main_page.dart';
import 'presentation/pages/task_page/task_page.dart';

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
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.manrope(
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: GoogleFonts.manrope(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      routes: {
        '/task': (_) => const TaskPage(),
      },
      home: const MyHomePage(title: 'Лаборато'),
    );
  }
}

Future<void> initServices() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter<TaskModel>(
    TaskModelAdapter(),
  );
  Hive.registerAdapter<TaskTypeModel>(
    TaskTypeModelAdapter(),
  );
  Hive.registerAdapter(
    DifficultyModelAdapter(),
  );
  await setup();
}
