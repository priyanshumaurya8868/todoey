import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/task.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({required this.task});

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
        onChanged: (value) {
          /// required to set listen 'false'  else it will th
          Provider.of<TaskData>(context, listen: false).updateTask(task);
        },
        value: task.isDone,
      ),
      onLongPress: () {
        Provider.of<TaskData>(context, listen: false).deleteTask(task);
      },
    );
  }
}
