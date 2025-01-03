import 'package:flutter/material.dart';
import 'package:my_training_app/presentation/views/widgets/icon_button.dart';
import 'package:my_training_app/presentation/views/widgets/training_item_card.dart';

import '../../../core/utils/constants.dart';
import '../widgets/training_carousel_slider.dart';
import 'filter_model_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trainings',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: Theme.of(context).textTheme.displayLarge?.fontWeight,
              letterSpacing: 5),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TrainingCarousel(
            trainingImages: sampleImages,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
            child: AppBorderButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75, // 75% of the screen height
                      child: const FilterModalScreen(), // Modal content
                    );
                  },
                );
              },
              preIcon: Icon(
                Icons.filter_alt_outlined,
                color: Theme.of(context).disabledColor,
                size: 16,
              ),
              title: 'Filter',
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).canvasColor,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return TrainingItemCard();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
