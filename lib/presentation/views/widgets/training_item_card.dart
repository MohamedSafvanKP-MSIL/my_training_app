import 'package:flutter/material.dart';
import 'package:my_training_app/presentation/views/widgets/AppFilledButton.dart';
import 'package:my_training_app/presentation/views/widgets/dotted_vertical_line.dart';
import 'package:my_training_app/presentation/views/widgets/profile_widget.dart';

import '../../../data/models/init_response.dart';

class TrainingItemCard extends StatelessWidget {
  const TrainingItemCard({super.key, required this.item});

  final TrainingItem item;

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
          // left part
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.date,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    item.time,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Text(
                  '${item.avenue}\n${item.location}',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.displaySmall?.color,
                      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.displaySmall?.fontWeight),
                ),
              ],
            ),
          ),

          // dash line
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

          // right part
          Expanded(
            flex: 2, // Occupies 2/3 of the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.badgeTitle != null)
                  Text(
                    item.badgeTitle ?? '',
                    style: TextStyle(
                        fontWeight: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.fontWeight,
                        color: Theme.of(context).primaryColor,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    item.trainingName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ProfileWidget(
                      traineeName: item.traineeName, imageURL: item.imageURL),
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
