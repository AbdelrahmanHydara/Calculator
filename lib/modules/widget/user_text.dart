import 'package:flutter/material.dart';

class UserText extends StatelessWidget
{
  final String userQuestionOrAnswer;
  final Alignment alignment;

  const UserText({super.key,
    required this.userQuestionOrAnswer,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: alignment,
      child: Text(
        userQuestionOrAnswer,
        style: const TextStyle(
           fontSize: 28,
        ),
      ),
    );
  }
}
