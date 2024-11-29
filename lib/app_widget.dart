import 'package:flutter/material.dart';
import 'package:weather_api/view/home_view.dart';
import 'package:weather_api/view/splash_view.dart';

class WeatherAPI extends StatelessWidget {
  const WeatherAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashView(),
        '/home': (context) => HomeView(),
      },
    );
  }
}
