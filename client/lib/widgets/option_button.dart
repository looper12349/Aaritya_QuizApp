import 'package:flutter/material.dart';
import 'package:quiz_app_frontend/models/question.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionButton({Key? key, required this.text, required this.onPressed, required Option option})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
