import 'dart:async';

import 'package:console_todo_management/model/todo.dart';
import 'package:console_todo_management/repository/fake_repository.dart';

class TodoService {
  TodoService();

  final FakeRepository repository = FakeRepository();

  Future<List<Todo>> get getAllTasks async => await repository.allTodos();

  Future<void> addNewTask(List<String> enterance) async {
    String? taskName, description;
    if (enterance.isNotEmpty) {
      taskName = enterance[0].trim();
      description = enterance.length >= 2 ? enterance[1] : 'No Description';

      repository.addTask(taskName: taskName, description: description);
      print('New task added!');
    } else {
      print('Try to write at least name of the task.');
    }
  }

  Future<void> removeTask(String? taskName) async {
    if (taskName != null) {
      await repository.removeTask(taskName: taskName);
      print('Task removed');
    } else {
      print('Type something to remove a specific task.');
    }
  }

  Future<void> completeTask(String? taskName) async {
      if (taskName != null && taskName != '') {
        await repository.completeTask(taskName: taskName);
      }
  }
}
