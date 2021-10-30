class Task implements Comparable {
  String todoString;
  String dueDateString;
  String tagString;

  DateTime dueDate;

  bool isDone = false;
  bool isPinned = false;

  Task({this.todoString, this.dueDateString, this.tagString, this.dueDate});

  @override
  int compareTo(other) {
    if (dueDate == null || other == null) {
      return null;
    }

    if (isPinned == other.isPinned) {
      // Same level -> compare due date.
      if (dueDate.isAfter(other.dueDate)) {
        return 1;
      } else if (dueDate.isBefore(other.dueDate)) {
        return -1;
      } else if (dueDate == other.dueDate) {
        return 0;
      }
    } else {
      // Pinned First
      if (other.isPinned) {
        return 1;
      } else if (isPinned) {
        return -1;
      }
    }

    return null;
  }
}
