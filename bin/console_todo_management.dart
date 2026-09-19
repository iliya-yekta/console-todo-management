import 'dart:io';

import 'package:console_todo_management/console/consoleUI.dart';

void main() async {
  final ConsoleUI consoleUI = ConsoleUI();

  while (true) {
    // Start point
    consoleUI.guild;

    final String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        await consoleUI.showAllTodoMessage();
        break;
      case '2':
        consoleUI.addTaskMessage();
        break;
      case '3':
        await consoleUI.removeTaskMessage();
        break;
      case '4':
        await consoleUI.completeTaskMessage();
      case '5':
        exit(0);
      case _:
        print('Invalid choice');
    }
  }
}
