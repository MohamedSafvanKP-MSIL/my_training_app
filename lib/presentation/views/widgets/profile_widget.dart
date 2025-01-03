import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25, // Set the radius of the circle
          backgroundImage: CachedNetworkImageProvider(
            "https://picsum.photos/id/103/2592/1936",
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
                'Helen Grible',
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
