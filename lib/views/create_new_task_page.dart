import 'package:dsc_flutter_example/models/task.dart';
import 'package:dsc_flutter_example/views/add_tag_page.dart';
import 'package:dsc_flutter_example/views/text_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CreateNewTaskPage extends StatefulWidget {
  const CreateNewTaskPage({Key key}) : super(key: key);

  @override
  _CreateNewTaskPageState createState() => _CreateNewTaskPageState();
}

class _CreateNewTaskPageState extends State<CreateNewTaskPage> {
  DateTime _dueDate;

  final String _dateHint = "Select Due Date";
  final String _tagHint = "Add Tag";

  String _date = "";
  String _tag = "";

  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent Keyboard Overflow
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // Fixed Spacing
            const SizedBox(
              height: 24,
            ),

            // Close (so fucking small like ad)
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: Transform.scale(
                scale: 0.8,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            // Fixed Spacing
            const SizedBox(
              height: 6,
            ),

            // Title
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Create New Task",
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
            const SizedBox(
              height: 48,
            ),

            // Input Task
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: TextField(
                controller: _contentController,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                  letterSpacing: 1.05,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100]),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[300]),
                  ),
                  hintText: "Task Name",
                  hintStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),

            // Fixed Spacing
            const SizedBox(
              height: 72,
            ),

            // Date Selector
            Container(
              height: 100,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[100],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  // Date Icon
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0x11FFBC0A),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(
                      Icons.date_range,
                      color: Color(0xFFFFBC0A),
                    ),
                  ),

                  // Fixed Spacing
                  const SizedBox(
                    width: 24,
                  ),

                  // Date
                  Text(
                    _date.isEmpty ? _dateHint : _date,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[700],
                      letterSpacing: _date.isEmpty ? 0 : 1.2,
                    ),
                  ),

                  // Spacing
                  const Spacer(),

                  // Select Date
                  Transform.scale(
                    scale: 0.8,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () async {
                        final DateTime result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100, 12),
                          builder: (BuildContext context, Widget child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light().copyWith(
                                  primary: const Color(0xFFFFBC0A),
                                ),
                              ),
                              child: child,
                            );
                          },
                        );

                        setState(() {
                          _dueDate = result;
                          _date = DateFormat('yyyy-MM-dd')
                              .format(result ?? DateTime.now());
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Fixed Spacing
            const SizedBox(
              height: 24,
            ),

            // Tag Selector
            Container(
              height: 100,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[100],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  // Tag Icon
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0x05EC0868),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(
                      Icons.tag,
                      color: Color(0xFFEC0868),
                    ),
                  ),

                  // Fixed Spacing
                  const SizedBox(
                    width: 24,
                  ),

                  // Tag
                  Expanded(
                    flex: 8,
                    child: Text(
                      _tag.isEmpty ? _tagHint : _tag,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  // Spacing
                  const Spacer(),

                  // Add Tag
                  Transform.scale(
                    scale: 0.8,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () async {
                        final String result = await showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          isScrollControlled:
                              true, // won't scroll when keyboard came out if isScrollControlled is set to false
                          context: context,
                          builder: (context) => const AddTagPage(),
                        );

                        setState(() {
                          _tag = result ?? _tag;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Spacing
            const Spacer(),

            // Create Task
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.black,
                child: const Text(
                  "CREATE TASK",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_contentController.text == "") {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(textSnackBar("You must enter a task."));
                  } else if (_date.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        textSnackBar("Please select a due date."));
                  } else if (_tag.isEmpty) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(textSnackBar("Please add a tag."));
                  } else {
                    Navigator.pop(
                      context,
                      Task(
                        todoString: _contentController.text,
                        dueDateString: _date,
                        tagString: _tag,
                        dueDate: _dueDate,
                      ),
                    );
                  }
                },
              ),
            ),

            // Fixed Spacing
            const SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
