import '../../../domain/entities/exercise_duration.dart';
import '../models/exercise_duration_model.dart';
import 'converter.dart';

class ExerciseDurationConverter
    implements Converter<ExerciseDurationModel, ExerciseDuration> {
  @override
  ExerciseDuration fromModel(ExerciseDurationModel model) {
    return ExerciseDuration(
      value: model.value,
      units: ExerciseDurationUnitConverter().fromModel(model.units),
    );
  }

  @override
  ExerciseDurationModel toModel(ExerciseDuration entity) {
    return ExerciseDurationModel()
      ..value = entity.value
      ..units = ExerciseDurationUnitConverter().toModel(entity.units);
  }
}

class ExerciseDurationUnitConverter
    implements Converter<DurationUnitModel, DurationUnit> {
  @override
  DurationUnit fromModel(DurationUnitModel model) {
    return switch (model) {
      DurationUnitModel.sec => DurationUnit.sec,
      DurationUnitModel.min => DurationUnit.min,
    };
  }

  @override
  DurationUnitModel toModel(DurationUnit entity) {
    return switch (entity) {
      DurationUnit.sec => DurationUnitModel.sec,
      DurationUnit.min => DurationUnitModel.min,
    };
  }
}
