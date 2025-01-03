import 'package:flutter/material.dart';

class AppBorderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? preIcon;
  final String title;

  const AppBorderButton(
      {Key? key, required this.onPressed, this.preIcon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
        // White background
        side: BorderSide(color: Theme.of(context).disabledColor),
        // Padding for button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (preIcon != null) preIcon!,
          Text(
            title, // Text label
            style: TextStyle(
              color: Theme.of(context).disabledColor, // Text color
              fontWeight: FontWeight.w500,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
            ),
          ),
        ],
      ),
    );
  }
}
