import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double originalPrice;
  final double newPrice;

  const PriceWidget({
    Key? key,
    required this.originalPrice,
    required this.newPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Original price with a line through it
        Text(
          '\$${originalPrice.toStringAsFixed(2)}',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            decorationColor: Theme.of(context).primaryColor,
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          ),
        ),
        SizedBox(width: 10), // Space between prices
        // New price
        Text(
          '\$${newPrice.toStringAsFixed(2)}',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
