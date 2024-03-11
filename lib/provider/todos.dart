import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Food 😋',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Todo(createdTime: DateTime.now(), title: 'Walk the Dog'),
    Todo(
      createdTime: DateTime.now(),
      title: "Plan Idara's birthday party",
    ),
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
