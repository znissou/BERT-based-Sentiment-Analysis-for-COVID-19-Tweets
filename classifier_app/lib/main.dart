import 'package:flutter/material.dart';
import 'package:sentiment_analysis/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/classify_screen.dart';
import 'screens/performance_screen.dart';
import 'screens/model_info_screen.dart';

void main() {
  runApp(const SentimentAnalysisApp());
}

class SentimentAnalysisApp extends StatelessWidget {
  const SentimentAnalysisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentiment Analysis',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/performance': (context) => const PerformanceScreen(),
        '/classification': (context) => const ClassifyScreen(),
        '/model_info': (context) => const ModelInfoScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
