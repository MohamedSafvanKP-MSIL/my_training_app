import 'package:flutter/material.dart';
import 'package:my_training_app/Utils/theme_modes.dart';
import 'package:my_training_app/views/screens/home.dart';
import 'package:my_training_app/views/widgets/training_carousel_slider.dart';

import 'Utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Trainings App.',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}


