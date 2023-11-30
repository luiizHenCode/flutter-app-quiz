import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key, required this.questionText});

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
