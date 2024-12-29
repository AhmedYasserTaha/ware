import 'package:flutter/material.dart';
import 'package:my_web_project/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ware 4 U',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // نبدأ بصفحة الترحيب
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
