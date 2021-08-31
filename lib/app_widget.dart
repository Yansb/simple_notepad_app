import 'package:flutter/material.dart';
import 'package:notes/create_edit_note.dart';
import 'package:notes/home_page.dart';
import 'package:notes/login/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      initialRoute: '/login',
      theme: ThemeData(primarySwatch: Colors.grey),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/create-note': (context) => CreateNotePage()
      },
    );
  }
}
