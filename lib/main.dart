import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/screen/task_screen.dart';
import 'models/task.dart';

void main() => runApp(TodoeyApp());

class TodoeyApp extends StatelessWidget {
  const TodoeyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
        color: Colors.lightBlueAccent,
        theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.black.withOpacity(0)),
            primaryColor: Colors.lightBlueAccent),
      ),
    );
  }
}

class TaskData extends ChangeNotifier {
  List<Task> _data = [];


  UnmodifiableListView get data{
    return UnmodifiableListView(_data);
  }

  void addTaks(Task task){
    _data.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggle();
    notifyListeners();
  }

  void deleteTask(Task task){
    _data.remove(task);
    notifyListeners();
  }

}
