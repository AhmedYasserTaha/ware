import 'package:flutter/material.dart';
import 'package:my_web_project/widget/widgets_product_card.dart';

class WomenClothingPage extends StatelessWidget {
  const WomenClothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;

    // تحديد عدد الأعمدة بناءً على عرض الشاشة
    int crossAxisCount = width > 1200 ? 4 : (width > 800 ? 3 : 2);

    // تحديد أحجام النصوص بناءً على عرض الشاشة
    double titleFontSize = width > 800 ? 18 : 14;
    double subtitleFontSize = width > 800 ? 16 : 12;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ملابس نسائية'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // التنقل إلى عربة التسوق
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: EdgeInsets.all(constraints.maxWidth * 0.04),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.7, // لضبط تناسب الصور مع الشاشة
              crossAxisSpacing: constraints.maxWidth * 0.04,
              mainAxisSpacing: constraints.maxHeight * 0.02,
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
