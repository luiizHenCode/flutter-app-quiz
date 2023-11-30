import 'package:flutter/material.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({
    super.key,
    required this.resetFn,
    required this.totalScore,
  });

  final void Function() resetFn;
  final int totalScore;

  String get message {
    if (totalScore < 12) {
      return "Parabéns!";
    } else if (totalScore < 24) {
      return "Você é bom!";
    } else if (totalScore < 36) {
      return "Impressionante!";
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Você concluiu o quiz com sucesso!",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            "Total de pontos: $totalScore",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: resetFn,
            child: const Text(
              "Reiniciar",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
