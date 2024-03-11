import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widgets/todo_form_widget.dart';

class EditTodopage extends StatefulWidget {
  final Todo todo;
  const EditTodopage({super.key, required this.todo});

  @override
  State<EditTodopage> createState() => _EditTodopageState();
}

class _EditTodopageState extends State<EditTodopage> {
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Todo'),
        ),
        body: TodoFormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
          onSavedTodo: () {},
        ),
      );
}
