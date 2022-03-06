import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/todo_list.dart';
import '../main.dart';
import '../models/task.dart';
import 'add_task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: AddTask(
                callback: (String newTask) {
                  Provider.of<TaskData>(context, listen: false).addTaks(
                    Task(newTask),
                  );
                },
              ),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 40.0,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Todoey",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    (Provider.of<TaskData>(context).data.length).toString() +
                        " Tasks",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                child: TodoList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
