import 'package:flutter/material.dart';
import 'package:notes/create_edit_note.dart';
import 'package:notes/shared/widgets/customButton_widget.dart';
import 'package:notes/shared/widgets/noteCard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              NoteCard(
                title: notes[i],
                onTap: () async {
                  final response = await Navigator.pushNamed(
                      context, '/create-note',
                      arguments: notes[i]);
                  if (response != null) {
                    var description = response as String;
                    if (response.isEmpty) {
                      notes.removeAt(i);
                    } else {
                      notes[i];
                    }
                    setState(() {});
                  }
                },
              ),
            CustomButton(
              onPressed: () async {
                final description =
                    await Navigator.pushNamed(context, '/create-note');
                if (description != null) {
                  notes.add(description as String);
                  setState(() {});
                }
              },
              label: "Criar nota",
            )
          ],
        ),
      ),
    );
  }
}
