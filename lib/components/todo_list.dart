import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/todo_item.dart';
import 'package:todoey/main.dart';


class TodoList extends StatefulWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(30.0),
      itemBuilder: (BuildContext context, int index) {
        return TodoItem(
            task: Provider.of<Data>(context).data[index],
            callback: (bool? newValue) {
              setState(() {
                Provider.of<Data>(context).data[index].toggle();
              });
            });
      },
      itemCount: Provider.of<Data>(context).data.length,
    );
  }
}
