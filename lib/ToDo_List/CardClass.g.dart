// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CardClass.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardTodoAdapter extends TypeAdapter<CardTodo> {
  @override
  final int typeId = 1;

  @override
  CardTodo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardTodo(
      date: fields[0] as String,
      colors: (fields[1] as List).cast<Color>(),
      todos: (fields[2] as List).cast<Todo>(),
    );
  }

  @override
  void write(BinaryWriter writer, CardTodo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.colors)
      ..writeByte(2)
      ..write(obj.todos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardTodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
