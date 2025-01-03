import 'package:flutter/material.dart';

class AppHero extends StatelessWidget {
  const AppHero({
    super.key,
    required this.heroId,
    this.onTap,
    required this.child,
  });

  final String heroId;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroId,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}