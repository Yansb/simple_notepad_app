import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const NoteCard({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(title), onTap: onTap),
    );
  }
}
