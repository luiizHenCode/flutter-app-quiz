import 'package:flutter/material.dart';

import './widgets/congratulation.dart';
import './widgets/quiz.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void reply(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex++;
        _totalScore += score;
      });
    }
  }

  bool get hasQuestion {
    return _questionIndex < _questions.length;
  }

  final List<Map<String, Object>> _questions = [
    {
      "question": "Qual é a sua cor favorita?",
      "answers": [
        {"label": "Preto", "score": 10},
        {"label": "Vermelho", "score": 5},
        {"label": "Verde", "score": 3},
        {"label": "Branco", "score": 1},
      ],
    },
    {
      "question": "Qual é o seu animal favorito?",
      "answers": [
        {"label": "Coelho", "score": 10},
        {"label": "Cobra", "score": 5},
        {"label": "Elefante", "score": 3},
        {"label": "Leão", "score": 1},
      ]
    },
    {
      "question": "Qual é o seu instrutor favorito?",
      "answers": [
        {"label": "Maria", "score": 10},
        {"label": "João", "score": 5},
        {"label": "Leo", "score": 3},
        {"label": "Pedro", "score": 1},
      ]
    },
    {
      "question": "Qual é o seu time favorito?",
      "answers": [
        {"label": "São Paulo", "score": 10},
        {"label": "Corinthians", "score": 5},
        {"label": "Palmeiras", "score": 3},
        {"label": "Santos", "score": 1},
      ]
    },
    {
      "question": "Qual é o seu carro favorito?",
      "answers": [
        {"label": "Ferrari", "score": 10},
        {"label": "Lamborghini", "score": 5},
        {"label": "Porsche", "score": 3},
        {"label": "BMW", "score": 1},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: hasQuestion
            ? AppBar(
                centerTitle: false,
                title: const Text(
                  'Quiz App',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.blueGrey[900],
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pergunta: ${_questionIndex + 1} / ${_questions.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: hasQuestion
              ? Quiz(
                  replyFn: reply,
                  hasQuestion: hasQuestion,
                  quentionIndex: _questionIndex,
                  questions: _questions,
                )
              : Congratulation(
                  resetFn: reset,
                  totalScore: _totalScore,
                ),
        ),
      ),
    );
  }
}
