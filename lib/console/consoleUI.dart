import 'package:console_todo_management/model/todo.dart';
import 'package:console_todo_management/service/todo_service.dart';

import 'dart:io';

class ConsoleUI {
  ConsoleUI();

  final TodoService service = TodoService();

  void get guild => print('''
--- Todo Task Management ---
1. Show all tasks
2. Add task
3. Remove task
4. Complete task
5. Exit 
    ''');

  Future<void> showAllTodoMessage() async {
    StringBuffer result = StringBuffer();

    print("All tasks: ");
    final List<Todo> todos = await service.getAllTasks;

    if (todos.isEmpty) {
      print("There's no task. Try add new one.");
    } else {
      for (Todo todo in todos) {
        result.writeln(todo);
        result.write('\n');
      }

      print(result);
    }
  }

  Future<void> addTaskMessage() async {
    print("Write name and description for task. ([Task name] [Description])");
    final enterance = stdin.readLineSync().toString().split(' ');
    service.addNewTask(enterance);
  }

  Future<void> removeTaskMessage() async {
    print('Enter task name to be removed');
    final taskName = stdin.readLineSync();

    service.removeTask(taskName);
  }

  Future<void> completeTaskMessage() async {
    print('Enter task name to be completed: ');
    final String? taskName = stdin.readLineSync();

    await service.completeTask(taskName);
  }
}
