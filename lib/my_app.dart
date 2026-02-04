import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/utils/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: UAppTheme.lightTheme,
      darkTheme: UAppTheme.darkTheme,
      home: OnboardingScreen(),
    );
  }
}