import 'package:console_todo_management/model/status_task.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  Todo(
    this.name, {
    required this.description,
    this.status = Status.pending,
    this.isCompleted = false,
  });

  Todo update({
    String? name,
    String? description,
    Status? status,
    DateTime? updatedAt,
    bool? isCompleted,
  })  {
    return Todo(
      this.name,
      description: this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      status: this.status,
    );
  }

  final String id = uuid.v4();
  final String name;
  final bool isCompleted;
  final Status status;
  final String? description;
  final DateTime createdAt = DateTime.now();

  @override
  String toString() {
    return 'name: $name \n status: ${status.name} \n descripton: ${description ?? 'no description'} \n created at: $createdAt \n completed: $isCompleted';
  }
}
