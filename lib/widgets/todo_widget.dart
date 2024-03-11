import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/pages/edit_todo_page.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({required this.todo, super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          startActionPane: ActionPane(
            key: Key(todo.id.toString()),
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => editTodo(context, todo),
                backgroundColor: Colors.green,
                icon: Icons.edit,
              ),
            ],
          ),
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: (context) => deleteTodo(context, todo),
              backgroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ]),
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);

                  Utils.showSnackBar(
                    context,
                    isDone ? 'Task completed' : 'Task marked incomplete',
                  );
                },
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 22),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTodopage(todo: todo),
      ),
    );
  }
}
