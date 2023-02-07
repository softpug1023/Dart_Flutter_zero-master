import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/application/theme_service.dart';
import 'package:my_app/navigation_example_screens/screen_one.dart';
import 'package:my_app/navigation_example_screens/screen_two.dart';
import 'package:my_app/presentation/counter/counter_screen.dart';
import 'package:my_app/presentation/list/list_screen.dart';
import 'package:my_app/presentation/widget_examples/home_screen.dart';
import 'package:my_app/root_button_navigation.dart';
import 'package:my_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, ThemeService, child) {
      return MaterialApp(
        themeMode: ThemeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: RootButtonNavigation(),
        routes: {
          '/root': (context) => const HomeScreen(),
          '/screenOne': (context) => const ScreenOne(),
          '/screenTwo': (context) => const ScreenTwo(),
        },
      );
    });
  }
}
