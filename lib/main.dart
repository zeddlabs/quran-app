import 'package:flutter/material.dart';
import 'package:quran_app/screens/main_screen.dart';
import 'package:quran_app/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? hasSeenOnboarding;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  hasSeenOnboarding = prefs.getInt('hasSeenOnboarding');
  await prefs.setInt('hasSeenOnboarding', 1);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hasSeenOnboarding == 0 || hasSeenOnboarding == null
          ? const OnboardingScreen()
          : const MainScreen(),
    );
  }
}
