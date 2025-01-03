import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {super.key,
      required this.traineeName,
      required this.imageURL});

  final String traineeName;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25, // Set the radius of the circle
          backgroundImage: CachedNetworkImageProvider(
            imageURL,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Keynote speaker',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                traineeName,
                style: TextStyle(
                    color: Theme.of(context).textTheme.displaySmall?.color,
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.displaySmall?.fontWeight),
              )
            ],
          ),
        )
      ],
    );
  }
}
