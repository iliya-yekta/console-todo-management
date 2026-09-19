import 'dart:async';

import 'package:console_todo_management/model/todo.dart';
import 'package:console_todo_management/repository/todo_repository.dart';

class FakeRepository extends TodoRepository {
  final List<Todo> _todos = [];

  Todo _findTask(String taskName) {
    return _todos.firstWhere((todo) => todo.name == taskName.trim());
  }

  int _indexTask(String taskName) {
    return _todos.indexWhere((todo) => todo.name == taskName);
  }

  @override
  Future<List<Todo>> allTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    return _todos;
  }

  @override
  Future<void> addTask({required String taskName, String? description}) async {
    _todos.add(Todo(taskName, description: description));
  }

  @override
  Future<void> completeTask({required String taskName}) async {
    final Todo tempTask = _findTask(taskName);

    _todos[_indexTask(taskName)] = tempTask.update(isCompleted: true);
  }

  @override
  Future<void> removeTask({required String taskName}) async {
    _todos.remove(_todos.firstWhere((todo) => todo.name == taskName));
  }
}
