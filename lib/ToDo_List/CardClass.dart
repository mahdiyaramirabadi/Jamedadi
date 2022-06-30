import 'package:flutter/cupertino.dart';
import 'package:jamedadi/ToDo_List/TodoClass.dart';
import 'package:hive/hive.dart';
part 'CardClass.g.dart';

@HiveType(typeId: 1)
class CardTodo {
  @HiveField(0)
  String date;
  @HiveField(1)
  List<Color> colors;
  @HiveField(2)
  List<Todo> todos;

  CardTodo({required this.date, required this.colors, required this.todos});
}
