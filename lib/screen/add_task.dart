import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
   AddTask({Key? key, required this.callback}) : super(key: key);
   String _newTask="";
   final Function(String) callback;
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
          ),
          TextField(
            autofocus: true,
            style: TextStyle(fontSize: 20.0),
            onChanged: (value){
              _newTask = value;
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.lightBlueAccent,
            child: TextButton(
              onPressed: () {
                if(_newTask.isNotEmpty)
                callback(_newTask);
                    Navigator.pop(context);
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
