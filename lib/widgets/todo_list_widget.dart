import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_widget.dart';
import 'package:todo_app/model/todo.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoWidget(
        todo: Todo(createdTime: DateTime.now(), title: 'Walk the Dog'));
  }
}
