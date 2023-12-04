import 'package:flutter/material.dart';

class MyButton extends StatelessWidget
{
  final Color color;
  final Color textColor;
  final String text;
  final Function() onTap;

  const MyButton({super.key,
    required this.color,
    required this.textColor,
    required this.text, required this.onTap});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 26,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
