import 'package:flutter/material.dart';
import 'package:my_web_project/widget/product_card.dart';

class BagsPage extends StatelessWidget {
  const BagsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حقائب'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final Size screenSize = MediaQuery.of(context).size;
          final double width = screenSize.width;

          // تحديد عدد الأعمدة بناءً على عرض الشاشة
          int crossAxisCount = width > 1200 ? 4 : (width > 800 ? 3 : 2);

          return GridView.builder(
            padding: const EdgeInsets.all(8.0), // استخدام padding ثابت
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio:
                  0.65, // تقليل الحجم قليلاً للحصول على تناسق أفضل
              crossAxisSpacing: 8.0, // مسافة ثابتة بين الأعمدة
              mainAxisSpacing: 8.0, // مسافة ثابتة بين الصفوف
            ),
            itemCount: bagsProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: bagsProducts[index]);
            },
          );
        },
      ),
    );
  }
}
