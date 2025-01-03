import 'package:flutter/material.dart';
import 'package:my_training_app/presentation/view_models/home_view_model.dart';
import 'package:my_training_app/presentation/views/widgets/icon_button.dart';
import 'package:my_training_app/presentation/views/widgets/training_item_card.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../widgets/training_carousel_slider.dart';
import 'filter_model_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel = Provider.of<HomeViewModel>(context, listen: false);
      viewModel.fetchTrainings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Trainings',
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight:
                    Theme.of(context).textTheme.displayLarge?.fontWeight,
                letterSpacing: 5),
          ),
        ),
        body: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (viewModel.errorMessage.isNotEmpty) {
            return Center(child: Text(viewModel.errorMessage));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TrainingCarousel(
                  trainingImages: sampleImages,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, bottom: 8, right: 16),
                  child: AppBorderButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.75, // 75% of the screen height
                            child: const FilterModalScreen(),
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
            );
          }
        }));
  }
}
