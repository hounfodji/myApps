import 'package:flutter/material.dart';
import 'package:flutter_chat_app/onboarding_page.dart';
import 'package:flutter_chat_app/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const OnBoardingPage(),
    );
  }
}
