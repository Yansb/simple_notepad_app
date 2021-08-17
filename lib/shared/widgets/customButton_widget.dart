import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const CustomButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
