import 'package:advicer/2_application/core/services/theme_service.dart';
import 'package:advicer/2_application/pages/advice/advice_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advicer/theme.dart';

import 'injection.dart' as di; //di == dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

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
        home: const AdvicePageWrapperProvider(),
      );
    });
  }
}
