import 'package:flutter/material.dart';
import 'package:my_training_app/core/utils/injection_container.dart' as di;
import 'package:my_training_app/core/utils/theme_modes.dart';
import 'package:my_training_app/presentation/view_models/home_view_model.dart';
import 'package:my_training_app/presentation/view_models/search_filter_view_model.dart';
import 'package:my_training_app/presentation/views/screens/home.dart';
import 'package:provider/provider.dart';

import 'core/utils/route_manager.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Trainings App.',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: RouteManager.home,
        onGenerateRoute: RouteManager.generateRoute,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => di.sl<HomeViewModel>()),
            ChangeNotifierProvider(
                create: (context) => di.sl<SearchFilterViewModel>()),
          ],
          child: const Home(),
        ));
  }
}
