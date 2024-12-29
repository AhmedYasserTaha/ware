import 'package:flutter/material.dart';
import 'package:my_web_project/page/women_clothing_page.dart';
import 'package:my_web_project/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ware 4 U',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
      ),
      // نبدأ بصفحة الترحيب
      home: WomenClothingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
