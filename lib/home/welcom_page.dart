import 'package:flutter/material.dart';
import 'package:my_web_project/page/bage_page.dart';
import 'package:my_web_project/page/kids_clothing_page.dart';
import 'package:my_web_project/page/shoes_page.dart';
import 'package:my_web_project/page/women_clothing_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;

    // تحديد أحجام النصوص والأيقونات بناءً على عرض الشاشة
    double titleFontSize = width > 800 ? 32 : 24;
    double subtitleFontSize = width > 800 ? 18 : 14;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/1.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    // العنوان الثابت مع حجم متجاوب
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: constraints.maxHeight * 0.03,
                        horizontal: constraints.maxWidth * 0.05,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'مرحباً بكم  ',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Text(
                            'اكتشف أحدث صيحات الموضة',
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Text(
                            'لو عجبك حاجه ممكن تاخدي اسكرين ليها و تتواصلي على ',
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.maps_ugc),
                              Text(
                                "01002240339",
                                style: TextStyle(
                                  fontSize: subtitleFontSize,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    // منطقة الأزرار المتجاوبة في أسفل الشاشة
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WomenClothingPage()),
                                );
                              },
                              child: Text("ملابس حريمي"),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KidsClothingPage()),
                                );
                              },
                              child: Text("الأطفال"),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BagsPage()),
                                );
                              },
                              child: Text("الشنط"),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShoesPage()),
                                );
                              },
                              child: Text("الأحذية"),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
