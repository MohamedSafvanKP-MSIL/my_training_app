import 'package:flutter/material.dart';

class SliderSwitchButton extends StatelessWidget {
  const SliderSwitchButton(
      {super.key, required this.onTap, this.buttonType = Icons.arrow_forward_ios_outlined});

  final Function() onTap;
  final IconData buttonType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20, // Width of the square
        height: 60, // Height of the square
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(50),
          shape: BoxShape.rectangle,
        ),
        child: Icon(
          buttonType,
          color: Theme.of(context).scaffoldBackgroundColor, // Arrow color
          size: 20, // Icon size
        ),
      ),
    );
  }
}
