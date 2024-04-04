import '../../../domain/entities/task.dart';
import '../models/task_model.dart';
import 'converter.dart';

class DifficultyConverter implements Converter<DifficultyModel, Difficulty> {
  @override
  Difficulty fromModel(DifficultyModel model) {
    return switch (model) {
      DifficultyModel.easy => Difficulty.easy,
      DifficultyModel.medium => Difficulty.medium,
      DifficultyModel.hard => Difficulty.hard,
    };
  }

  @override
  DifficultyModel toModel(Difficulty entity) {
    return switch (entity) {
      Difficulty.easy => DifficultyModel.easy,
      Difficulty.medium => DifficultyModel.medium,
      Difficulty.hard => DifficultyModel.hard,
    };
  }
}
