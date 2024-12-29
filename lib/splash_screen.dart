import 'package:flutter/material.dart';
import 'package:my_web_project/home/welcom_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // عرض الصورة لمدة 3 ثوانٍ ثم الانتقال إلى الصفحة الرئيسية
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/1.jpg'),
            fit: BoxFit.fill, // تملأ الشاشة بالكامل
          ),
        ),
      ),
    );
  }
}
