import 'package:flutter/material.dart';
import 'package:notes/shared/widgets/customButton_widget.dart';
import 'package:notes/shared/widgets/textField_widget.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Note" : "Create Note"),
        centerTitle: true,
        actions: [
          if (isEdit)
            IconButton(
                onPressed: () {
                  Navigator.pop(context, "");
                },
                icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              onChanged: (value) {
                description = value;
                setState(() {});
              },
              labelText: "Descrição",
              controller: textController,
            ),
            SizedBox(
              height: 32,
            ),
            if (description.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    label: "Salvar",
                    onPressed: () {
                      Navigator.pop(context, description);
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
