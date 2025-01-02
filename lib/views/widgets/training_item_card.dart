import 'package:flutter/material.dart';
import 'package:my_training_app/views/widgets/AppFilledButton.dart';
import 'package:my_training_app/views/widgets/dotted_vertical_line.dart';
import 'package:my_training_app/views/widgets/profile_widget.dart';

class TrainingItemCard extends StatelessWidget {
  const TrainingItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: Colors.grey.shade300),
        // Border for definition
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).disabledColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Oct 11-13, 2019',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    '8:30 am- 12:30 pm',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Text(
                  'Convention Hall, Greater des Moines',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.displaySmall?.color,
                      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.displaySmall?.fontWeight),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: VerticalDashedLine(
              height: 120,
              // Adjust as needed
              dashHeight: 4,
              dashSpacing: 4,
              color: Colors.grey,
              width: 1,
            ),
          ),
          Expanded(
            flex: 2, // Occupies 2/3 of the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filling fast!',
                  style: TextStyle(
                      fontWeight:
                          Theme.of(context).textTheme.displaySmall?.fontWeight,
                      color: Theme.of(context).primaryColor,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Safe scrum master (4.6)',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ProfileWidget(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppFilledButtonButton(
                      onPressed: () {},
                      title: 'Enrol Now',
                      fillColor: Theme.of(context).primaryColor,
                      titleColor: Theme.of(context).scaffoldBackgroundColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
