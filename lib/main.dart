import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';
import 'package:water_billing/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themColor,
      ),
      home: const Splash(),
    );
  }
}
