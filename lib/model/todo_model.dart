class TodoModel {
  String title;
  bool completed;

  TodoModel({required this.title, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}
