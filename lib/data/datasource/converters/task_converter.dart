import '../../../domain/entities/task.dart';
import '../models/task_model.dart';
import 'converter.dart';
import 'difficulty_converter.dart';
import 'exercise_duration_converter.dart';
import 'task_type_converter.dart';

class TaskConverter implements Converter<TaskModel, TaskEntity> {
  @override
  TaskEntity fromModel(TaskModel model) {
    return TaskEntity(
      name: model.name,
      description: model.description,
      type: TaskTypeConverter().fromModel(
        model.type,
      ),
      difficulty: DifficultyConverter().fromModel(
        model.difficulty,
      ),
      id: model.key as int,
      duration: ExerciseDurationConverter().fromModel(model.duration),
    );
  }

  @override
  TaskModel toModel(TaskEntity entity) {
    return TaskModel()
      ..name = entity.name
      ..description = entity.description
      ..type = TaskTypeConverter().toModel(entity.type)
      ..difficulty = DifficultyConverter().toModel(entity.difficulty)
      ..duration = ExerciseDurationConverter().toModel(entity.duration);
  }
}
