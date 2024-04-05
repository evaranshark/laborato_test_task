// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_duration_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseDurationModelAdapter extends TypeAdapter<ExerciseDurationModel> {
  @override
  final int typeId = 3;

  @override
  ExerciseDurationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseDurationModel()
      ..value = fields[0] as int
      ..units = fields[1] as DurationUnitModel;
  }

  @override
  void write(BinaryWriter writer, ExerciseDurationModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.units);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseDurationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DurationUnitModelAdapter extends TypeAdapter<DurationUnitModel> {
  @override
  final int typeId = 4;

  @override
  DurationUnitModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DurationUnitModel.sec;
      case 1:
        return DurationUnitModel.min;
      default:
        return DurationUnitModel.sec;
    }
  }

  @override
  void write(BinaryWriter writer, DurationUnitModel obj) {
    switch (obj) {
      case DurationUnitModel.sec:
        writer.writeByte(0);
        break;
      case DurationUnitModel.min:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DurationUnitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
