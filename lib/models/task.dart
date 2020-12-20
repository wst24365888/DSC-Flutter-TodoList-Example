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
    if (this.dueDate == null || other == null) {
      return null;
    }

    if (this.isPinned == other.isPinned) {
      // Same level -> compare due date.
      if (this.dueDate.isAfter(other.dueDate)) {
        return 1;
      } else if (this.dueDate.isBefore(other.dueDate)) {
        return -1;
      } else if (this.dueDate == other.dueDate) {
        return 0;
      }
    } else {
      // Pinned First
      if (other.isPinned) {
        return 1;
      } else if (this.isPinned) {
        return -1;
      }
    }

    return null;
  }
}
