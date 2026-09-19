import 'package:console_todo_management/model/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> allTodos();

  Future<void> completeTask({required String taskName});

  Future<void> removeTask({required String taskName});

  Future<void> addTask({required String taskName, String description});
}
