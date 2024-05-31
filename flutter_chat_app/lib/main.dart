import 'package:flutter/material.dart';
import 'package:flutter_chat_app/onboarding_page.dart';
import 'package:flutter_chat_app/theme_notifier.dart';
import 'package:flutter_chat_app/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
      ProviderScope(child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeMode,
      home: const OnBoardingPage(),
    );
  }
}
