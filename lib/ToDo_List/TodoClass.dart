import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'TodoClass.g.dart';

@HiveType(typeId: 2)
class Todo {
  Todo(
      {required this.id,
      required this.name,
      required this.checked,
      required this.time});
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  bool checked;
  @HiveField(3)
  String time;
}
