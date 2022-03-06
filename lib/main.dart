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
      create: (context) => Data(),
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

class Data extends ChangeNotifier {
  List<Task> data = [];
  void addTaks(Task task){
    data.add(task);
    notifyListeners();
  }
}
