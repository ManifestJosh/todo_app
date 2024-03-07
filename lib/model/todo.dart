import 'package:flutter/cupertino.dart';
import 'package:todo_app/provider/todos.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String? id;
  String description;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}
