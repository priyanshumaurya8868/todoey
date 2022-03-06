import 'package:flutter/material.dart';
import '../models/task.dart';

class TodoItem extends StatelessWidget {
  TodoItem({required this.task, required this.callback});

  void Function(bool?)? callback;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration:
            task.isDone ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        onChanged: callback,
        value: task.isDone,
      ),
    );
  }
}
