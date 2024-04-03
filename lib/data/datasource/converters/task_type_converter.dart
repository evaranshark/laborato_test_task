import '../../../domain/entities/task.dart';
import '../models/task_model.dart';
import 'converter.dart';

class TaskTypeConverter implements Converter<TaskTypeModel, TaskType> {
  @override
  TaskType fromModel(TaskTypeModel model) {
    return switch (model) {
      TaskTypeModel.cardio => TaskType.cardio,
      TaskTypeModel.strength => TaskType.strength,
      TaskTypeModel.balance => TaskType.balance,
      TaskTypeModel.flexibility => TaskType.flexibility,
    };
  }

  @override
  TaskTypeModel toModel(TaskType entity) {
    return switch (entity) {
      TaskType.cardio => TaskTypeModel.cardio,
      TaskType.strength => TaskTypeModel.strength,
      TaskType.balance => TaskTypeModel.balance,
      TaskType.flexibility => TaskTypeModel.flexibility,
    };
  }
}
