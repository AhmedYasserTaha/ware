import 'package:flutter/material.dart';
import 'package:my_web_project/page/bage_page.dart';
import 'package:my_web_project/page/kids_clothing_page.dart';
import 'package:my_web_project/page/shoes_page.dart';
import 'package:my_web_project/page/women_clothing_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  void _navigateToCategory(BuildContext context, String category) {
    Widget page;
    switch (category) {
      case 'ملابس نسائية':
        page = const WomenClothingPage();
        break;
      case 'ملابس أطفال':
        page = const KidsClothingPage();
        break;
      case 'أحذية':
        page = const ShoesPage();
        break;
      case 'حقائب':
        page = const BagsPage();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;

    // تحديد أحجام النصوص والأيقونات بناءً على عرض الشاشة
    double titleFontSize = width > 800 ? 32 : 24;
    double subtitleFontSize = width > 800 ? 18 : 14;
    double buttonTextSize = width > 800 ? 18 : 14; // تم تقليص حجم النص
    double iconSize = width > 800 ? 50 : 35; // تم تقليص حجم الأيقونة

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
                    Expanded(
                      child: Align(
                        alignment: Alignment
                            .bottomCenter, // وضع الأزرار في أسفل الشاشة
                        child: Padding(
                          padding: EdgeInsets.all(constraints.maxWidth * 0.03),
                          child: Container(
                            // تقليص حجم الأزرار بشكل كامل
                            width:
                                constraints.maxWidth * 0.7, // تقليص عرض الأزرار
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount:
                                  width > 800 ? 4 : 2, // التحكم بعدد الأعمدة
                              crossAxisSpacing: constraints.maxWidth * 0.02,
                              mainAxisSpacing: constraints.maxHeight * 0.02,
                              childAspectRatio: 1.0,
                              children: [
                                _buildCategoryButton(
                                  context,
                                  'ملابس نسائية',
                                  Icons.person_outline,
                                  Colors.pink,
                                  () => _navigateToCategory(
                                      context, 'ملابس نسائية'),
                                  buttonTextSize,
                                  iconSize,
                                ),
                                _buildCategoryButton(
                                  context,
                                  'ملابس أطفال',
                                  Icons.child_care,
                                  Colors.orange,
                                  () => _navigateToCategory(
                                      context, 'ملابس أطفال'),
                                  buttonTextSize,
                                  iconSize,
                                ),
                                _buildCategoryButton(
                                  context,
                                  'أحذية',
                                  Icons.shop,
                                  Colors.green,
                                  () => _navigateToCategory(context, 'أحذية'),
                                  buttonTextSize,
                                  iconSize,
                                ),
                                _buildCategoryButton(
                                  context,
                                  'حقائب',
                                  Icons.shopping_bag,
                                  Colors.purple,
                                  () => _navigateToCategory(context, 'حقائب'),
                                  buttonTextSize,
                                  iconSize,
                                ),
                              ],
                            ),
                          ),
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

  Widget _buildCategoryButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
    double fontSize,
    double iconSize,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(constraints.maxWidth * 0.08),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(constraints.maxWidth * 0.08),
              child: Padding(
                padding: EdgeInsets.all(
                    constraints.maxWidth * 0.05), // تم تقليص الحواف
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: iconSize,
                      color: color,
                    ),
                    SizedBox(
                        height: constraints.maxHeight *
                            0.03), // تقليص المسافة بين الأيقونة والنص
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
