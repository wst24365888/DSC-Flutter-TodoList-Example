import 'package:flutter/material.dart';
import 'package:dsc_flutter_example/views/view_tasks_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSC Flutter Example',
      theme: ThemeData(
        primaryColor: const Color(0xFFC200FB),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: ViewTasksPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
