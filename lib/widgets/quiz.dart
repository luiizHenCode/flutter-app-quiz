import 'package:flutter/material.dart';

import '../widgets/question.dart';
import '../widgets/reply.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    super.key,
    required this.replyFn,
    required this.hasQuestion,
    required this.quentionIndex,
    required this.questions,
  });

  final void Function(int score) replyFn;
  final bool hasQuestion;
  final int quentionIndex;
  final List<Map<String, Object>> questions;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasQuestion ? questions[quentionIndex].cast()["answers"] : [];

    List<Widget> widgets = answers
        .map((e) => Reply(
              replyText: e["label"].toString(),
              replyFn: () => replyFn(int.parse(e["score"].toString())),
            ))
        .toList();

    return Column(
      children: [
        Question(
          questionText: questions[quentionIndex]["question"].toString(),
        ),
        ...widgets,
      ],
    );
  }
}
