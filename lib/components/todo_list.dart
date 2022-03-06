import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/todo_item.dart';
import 'package:todoey/main.dart';


class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// after wrapping this into consumer class, now we don't
    /// need to write 'Provider.of<TaskData>(context).' repeatedly.
    return Consumer<TaskData>(
      builder: (context,taskData,child){
        return ListView.builder(
          padding: EdgeInsets.all(30.0),
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(task :taskData.data[index]);
          },
          itemCount: taskData.data.length,
        );
      },
    );
  }
}
