import 'package:flutter/material.dart';
import 'package:my_training_app/presentation/views/screens/detail_screen.dart';
import 'package:my_training_app/presentation/views/screens/home.dart';
import 'package:provider/provider.dart';

import '../../data/models/init_response.dart';
import '../../presentation/views/screens/error_screen.dart';

class RouteManager {
  // Define route names as constants
  static const String home = '/';
  static const String details = '/Details';

  // Generate routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case details:
        final args = settings.arguments as TrainingItem;
        return MaterialPageRoute(
            builder: (context) => DetailsScreen(item: args));
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const ErrorScreen(error: '404 \n No screen Found'),
        );
    }
  }

  static pushName(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }
}
