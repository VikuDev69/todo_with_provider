import 'package:flutter/material.dart';
//import dart:collection for UnmodifiableListView class
import 'dart:collection';
import '../model/todo_model.dart';

class TodoProvider with ChangeNotifier {
//you can put one or two dummy task
  List<TodoModel> _tasks = [];
//to get all the tasks
  UnmodifiableListView<TodoModel> get allTasks => UnmodifiableListView(_tasks);
//all new added task must be uncompleted
  void addTask(String task) {
    _tasks.add(TodoModel(title: task, completed: false));
    notifyListeners();
  }

//we are not working with task id that why we are working with every tasks index number to modify
  void toggleTask(TodoModel task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TodoModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
