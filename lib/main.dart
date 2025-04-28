import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_dev_guide/pages/backendpages/backend_home_page.dart';
import 'package:frontend_dev_guide/pages/home_page.dart';
import 'package:frontend_dev_guide/pages/professions_selection_page.dart';
import 'package:frontend_dev_guide/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const TechCareerGuideApp(),
    ),
  );
}

class TechCareerGuideApp extends StatelessWidget {
  const TechCareerGuideApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Career Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfessionSelectionPage(),
        '/frontend_guide': (context) => const HomePage(),
        '/backend_guide': (context) => const BackendHomePage(),
      },
    );
  }
}
