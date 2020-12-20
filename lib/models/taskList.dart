import './task.dart';

class TaskList {
  List<Task> _tasks = [];

  List<Task> get task => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  void sortTask() {
    _tasks.sort((a, b) => a.compareTo(b));
  }
}
