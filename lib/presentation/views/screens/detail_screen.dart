import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_training_app/presentation/views/widgets/app_hero.dart';
import 'package:my_training_app/presentation/views/widgets/price_widget.dart';

import '../../../data/models/init_response.dart';

// A dummy detailed screen
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.item});

  final TrainingItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.trainingName,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: Theme.of(context).textTheme.displayLarge?.fontWeight,
              letterSpacing: 2),
        ),
      ),
      body: AppHero(
        heroId: item.id,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: item.imageURL,
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
                ),
                const SizedBox(height: 16),

                // Badge
                if (item.badgeTitle != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item.badgeTitle ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),

                // Training Name
                Text(
                  item.trainingName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),

                // Trainer Name
                Text(
                  'Trainer: ${item.traineeName}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),

                // Date and Time
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 8),
                    Text(item.date),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 20),
                    const SizedBox(width: 8),
                    Text(item.time),
                  ],
                ),
                const SizedBox(height: 16),

                // Venue and Location
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 20),
                    const SizedBox(width: 8),
                    Text('${item.avenue} - ${item.location}'),
                  ],
                ),
                const SizedBox(height: 16),

                // Pricing
                PriceWidget(originalPrice: item.traineeFee, newPrice: item.offerPrice),
                const SizedBox(height: 16),

                // Register Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text('Register Now'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
