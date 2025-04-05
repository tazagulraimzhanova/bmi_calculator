import 'package:flutter/material.dart';
import 'bmi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.light(), // Тёмная тема
      home: const BmiPage(), // Главный экран
    );
  }
}
