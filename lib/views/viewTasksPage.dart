import 'package:dsc_flutter_example/models/taskList.dart';
import 'package:dsc_flutter_example/views/createNewTaskPage.dart';
import 'package:dsc_flutter_example/views/textSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewTasksPage extends StatefulWidget {
  ViewTasksPage({Key key}) : super(key: key);

  @override
  _ViewTasksPageState createState() => _ViewTasksPageState();
}

class _ViewTasksPageState extends State<ViewTasksPage> {
  TaskList _taskList = TaskList();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // Fixed Spacing
            SizedBox(
              height: 78,
            ),

            // Title
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tasks",
                style: TextStyle(
                  fontSize: 50,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                  letterSpacing: 1.05,
                ),
              ),
            ),

            // Fixed Spacing
            SizedBox(
              height: 48,
            ),

            // Task List
            Expanded(
              flex: 9,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      // Remove the item from the data source.
                      setState(() {
                        _taskList.task.removeAt(index);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        textSnackBar("Task dismissed."),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _taskList.task[index].isDone =
                              !_taskList.task[index].isDone;
                          _taskList.sortTask();
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          _taskList.task[index].isPinned =
                              !_taskList.task[index].isPinned;

                          ScaffoldMessenger.of(context).showSnackBar(
                            textSnackBar(_taskList.task[index].isPinned
                                ? "Task pinned."
                                : "Task unpinned."),
                          );

                          _taskList.sortTask();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: _taskList.task[index].isPinned
                              ? Border.all(
                                  color: Colors.blueGrey[900],
                                  width: 2.0,
                                )
                              : Border.all(color: Colors.blueGrey[100]),
                          color: _taskList.task[index].isDone
                              ? const Color(0xFFFFBC0A)
                              : Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Todo String
                                Expanded(
                                  child: Text(
                                    _taskList.task[index].todoString,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ),

                                // Spacing
                                SizedBox(
                                  width: 4,
                                ),

                                // Complete Icon
                                _taskList.task[index].isDone
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      )
                                    : Container(),
                              ],
                            ),

                            // Spacing
                            SizedBox(
                              height: 18,
                            ),

                            // Task Detail
                            Row(
                              children: [
                                // Tag String
                                Text(
                                  _taskList.task[index].tagString,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: _taskList.task[index].isDone
                                        ? Colors.white
                                        : Colors.grey[500],
                                  ),
                                ),

                                // Spacing
                                Spacer(),

                                // Due Date String
                                _taskList.task[index].isDone
                                    ? Text(
                                        "COMPLETED",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        _taskList.task[index].dueDateString,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
                itemCount: _taskList.task != [] ? _taskList.task.length : 0,
              ),
            ),

            // Spacing
            Spacer(
              flex: 1,
            ),

            // Create Task
            Container(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.black,
                child: Text(
                  "ADD TASK",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  final _task = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CreateNewTaskPage(),
                    ),
                  );

                  setState(() {
                    if (_task != null) {
                      _taskList.addTask(_task);
                    }

                    _taskList.sortTask();
                  });
                },
              ),
            ),

            // Fixed Spacing
            SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
