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

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }
}
