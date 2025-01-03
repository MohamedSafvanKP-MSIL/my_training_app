import 'package:flutter/material.dart';
import 'package:my_training_app/core/utils/injection_container.dart' as di;
import 'package:my_training_app/core/utils/theme_modes.dart';
import 'package:my_training_app/presentation/view_models/home_view_model.dart';
import 'package:my_training_app/presentation/views/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  di.init();
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
        home: ChangeNotifierProvider(
          create: (context) => di.sl<HomeViewModel>(),
          child: const Home(),
        ));
  }
}
