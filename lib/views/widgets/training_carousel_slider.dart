import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_training_app/views/widgets/slider_switch_button.dart';

class TrainingCarousel extends StatefulWidget {
  final List<String> trainingImages;

  const TrainingCarousel({super.key, required this.trainingImages});

  @override
  State<TrainingCarousel> createState() => _TrainingCarouselState();
}

class _TrainingCarouselState extends State<TrainingCarousel> {
  final _carouselController = CarouselSliderController();
  final carouselSliderHeight = 300.0;
  final carouselDuration = const Duration(milliseconds: 300);

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
                color: Theme.of(context).primaryColor,
                height: (carouselSliderHeight / 2),
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
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
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight:
                        Theme.of(context).textTheme.displayLarge?.fontWeight,
                    letterSpacing: 1),
              )),
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            items: widget.trainingImages.map((image) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Theme.of(context).scaffoldBackgroundColor,
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
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          Positioned(
              right: 0,
              child: SliderSwitchButton(onTap: () {
                _carouselController.nextPage(
                  duration: carouselDuration,
                  curve: Curves.easeInOut,
                );
              })),
        ],
      ),
    );
  }
}
