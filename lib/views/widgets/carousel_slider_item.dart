import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_training_app/views/widgets/price_widget.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
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
        Container(color: Theme.of(context).canvasColor.withAlpha(75)),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Safe scrum master',
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight:
                        Theme.of(context).textTheme.displayLarge?.fontWeight,
                    letterSpacing: 1),
              ),
              Text(
                'West des moines',
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    letterSpacing: 1),
              ),
              PriceWidget(originalPrice: 976, newPrice: 850)
            ],
          ),
        ),
        Positioned(
            right: 20,
            bottom: 20,
            child: Row(
              children: [
                Text(
                  'View Details',
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      letterSpacing: 1),
                ),
                Icon(
                  Icons.arrow_forward_sharp,
                  color: Theme.of(context).scaffoldBackgroundColor,
                )
              ],
            ))
      ],
    );
  }
}
