import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final String labelText;
  const TextFieldWidget(
      {Key? key,
      this.controller,
      required this.onChanged,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
