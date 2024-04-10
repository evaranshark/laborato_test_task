// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel()
      ..name = fields[0] as String
      ..description = fields[1] as String
      ..type = fields[2] as TaskTypeModel
      ..difficulty = fields[3] as DifficultyModel
      ..duration = fields[4] as ExerciseDurationModel;
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.difficulty)
      ..writeByte(4)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskTypeModelAdapter extends TypeAdapter<TaskTypeModel> {
  @override
  final int typeId = 1;

  @override
  TaskTypeModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskTypeModel.cardio;
      case 1:
        return TaskTypeModel.strength;
      case 2:
        return TaskTypeModel.balance;
      case 3:
        return TaskTypeModel.flexibility;
      default:
        return TaskTypeModel.cardio;
    }
  }

  @override
  void write(BinaryWriter writer, TaskTypeModel obj) {
    switch (obj) {
      case TaskTypeModel.cardio:
        writer.writeByte(0);
        break;
      case TaskTypeModel.strength:
        writer.writeByte(1);
        break;
      case TaskTypeModel.balance:
        writer.writeByte(2);
        break;
      case TaskTypeModel.flexibility:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DifficultyModelAdapter extends TypeAdapter<DifficultyModel> {
  @override
  final int typeId = 2;

  @override
  DifficultyModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DifficultyModel.easy;
      case 1:
        return DifficultyModel.medium;
      case 2:
        return DifficultyModel.hard;
      default:
        return DifficultyModel.easy;
    }
  }

  @override
  void write(BinaryWriter writer, DifficultyModel obj) {
    switch (obj) {
      case DifficultyModel.easy:
        writer.writeByte(0);
        break;
      case DifficultyModel.medium:
        writer.writeByte(1);
        break;
      case DifficultyModel.hard:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DifficultyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
