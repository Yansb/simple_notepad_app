import 'package:flutter/material.dart';
import 'package:notes/create_edit_note.dart';
import 'package:notes/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      initialRoute: '/home',
      theme: ThemeData(primarySwatch: Colors.grey),
      routes: {
        '/home': (context) => HomePage(),
        '/create-note': (context) => CreateNotePage()
      },
    );
  }
}
