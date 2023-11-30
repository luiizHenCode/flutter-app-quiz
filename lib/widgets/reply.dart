import 'package:flutter/material.dart';

class Reply extends StatelessWidget {
  const Reply({super.key, required this.replyText, required this.replyFn});

  final String replyText;
  final void Function() replyFn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: replyFn,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.blueGrey.shade900,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Text(
          replyText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
