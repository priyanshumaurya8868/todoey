import 'package:flutter/material.dart';

class Task {

Task(this.title, {this.isDone = false});
  final String title;
  bool isDone;

  void toggle(){
    isDone = !isDone;
  }
}