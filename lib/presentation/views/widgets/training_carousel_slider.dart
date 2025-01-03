import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_training_app/presentation/view_models/home_view_model.dart';
import 'package:my_training_app/presentation/views/widgets/app_hero.dart';
import 'package:my_training_app/presentation/views/widgets/carousel_slider_item.dart';
import 'package:my_training_app/presentation/views/widgets/slider_switch_button.dart';
import 'package:provider/provider.dart';

import '../../../data/models/init_response.dart';

class TrainingCarousel extends StatefulWidget {
  final List<TrainingItem> highlights;

  const TrainingCarousel({super.key, required this.highlights});

  @override
  State<TrainingCarousel> createState() => _TrainingCarouselState();
}

class _TrainingCarouselState extends State<TrainingCarousel> {
  final _carouselController = CarouselSliderController();
  final carouselSliderHeight = 300.0;
  final carouselDuration = const Duration(milliseconds: 300);
  final curve = Curves.easeInOut;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: carouselSliderHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                color: Theme
                    .of(context)
                    .primaryColor,
                height: (carouselSliderHeight / 2),
              ),
              Container(
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
                height: (carouselSliderHeight / 2),
              ),
            ],
          ),
          Positioned(
              top: 0,
              left: 20,
              child: Text(
                'Highlights',
                style: TextStyle(
                    fontSize:
                    Theme
                        .of(context)
                        .textTheme
                        .displaySmall
                        ?.fontSize,
                    color: Theme
                        .of(context)
                        .scaffoldBackgroundColor,
                    fontWeight:
                    Theme
                        .of(context)
                        .textTheme
                        .displayLarge
                        ?.fontWeight,
                    letterSpacing: 1),
              )),
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            items: widget.highlights.map((highlight) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppHero(
                  heroId: highlight.id,
                  onTap: () {
                    context
                        .read<HomeViewModel>()
                        .moveToGroupDetails(highlight, context);
                  },
                  child: CarouselSliderItem(
                    item: highlight,
                  ),
                ),
              );
            }).toList(),
          ),
          Positioned(
            left: 0,
            child: SliderSwitchButton(
              buttonType: Icons.arrow_back_ios_new_outlined,
              onTap: () {
                _carouselController.previousPage(
                  duration: carouselDuration,
                  curve: curve,
                );
              },
            ),
          ),
          Positioned(
              right: 0,
              child: SliderSwitchButton(onTap: () {
                _carouselController.nextPage(
                  duration: carouselDuration,
                  curve: curve,
                );
              })),
        ],
      ),
    );
  }
}
