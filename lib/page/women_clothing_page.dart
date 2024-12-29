import 'package:flutter/material.dart';
import 'package:my_web_project/widget/product_card.dart';

class WomenClothingPage extends StatelessWidget {
  const WomenClothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ملابس نسائية'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final Size screenSize = MediaQuery.of(context).size;
          final double width = screenSize.width;

          // تحديد عدد الأعمدة بناءً على عرض الشاشة
          int crossAxisCount = width > 1200
              ? 4
              : (width > 800 ? 3 : 2); // إذا كانت الشاشة صغيرة نعرض عمودين فقط

          return GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: width > 800 ? 16.0 : 8.0, // padding أقل للشاشات الصغيرة
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.55, // تقليل الحجم ليتناسب مع الشاشات الصغيرة
              crossAxisSpacing: 6.0, // مسافة أصغر بين الأعمدة
              mainAxisSpacing: 6.0, // مسافة أصغر بين الصفوف
            ),
            itemCount: womenProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: womenProducts[index]);
            },
          );
        },
      ),
    );
  }
}
