import 'package:flutter/material.dart';

class VerticalDashedLine extends StatelessWidget {
  final double height;
  final double dashHeight;
  final double dashSpacing;
  final Color color;
  final double width;

  const VerticalDashedLine({
    super.key,
    this.height = 200,
    this.dashHeight = 8,
    this.dashSpacing = 4,
    this.color = Colors.grey,
    this.width = 2,
  });

  @override
  Widget build(BuildContext context) {
    int dashCount = (height / (dashHeight + dashSpacing)).floor();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(dashCount, (index) {
        return Container(
          width: width, // Dash width
          height: dashHeight, // Dash height
          color: color,
          margin: EdgeInsets.only(bottom: index == dashCount - 1 ? 0 : dashSpacing),
        );
      }),
    );
  }
}