import 'package:flutter/material.dart';

class AddTagPage extends StatefulWidget {
  @override
  _AddTagPageState createState() => _AddTagPageState();
}

class _AddTagPageState extends State<AddTagPage> {
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
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            // Title
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Add Tag",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
            ),

            // Fixed Spacing
            SizedBox(
              height: 12,
            ),

            // TextField
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: _contentController,
                style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 1.05,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100]),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[300]),
                  ),
                  hintText: "Add some tag...",
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),

            // Fixed Spacing
            SizedBox(
              height: 20,
            ),

            // Add Button
            Padding(
              padding: EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                      context,
                      _contentController.text == ""
                          ? null
                          : _contentController.text);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "ADD",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEC0868),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
