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
      ..type = fields[2] as TaskTypeModel;
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.type);
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
