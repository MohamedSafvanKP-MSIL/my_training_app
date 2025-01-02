import 'package:flutter/material.dart';

class AppFilledButtonButton extends StatelessWidget {
  const AppFilledButtonButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.fillColor,
      this.fontSize,
      this.titleColor});

  final Function() onPressed;
  final String title;
  final Color fillColor;
  final double? fontSize;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: fillColor,
        padding: EdgeInsets.zero,
        minimumSize: const Size(75, 25),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Text(
        title, // Your button text here
        style: TextStyle(
            color: titleColor ?? Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: fontSize ?? 10), // Text style
      ),
    );
  }
}
