import 'package:flutter/material.dart';
import 'package:my_web_project/widget/widgets_product_card.dart';

class KidsClothingPage extends StatelessWidget {
  const KidsClothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ملابس أطفال'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final Size screenSize = MediaQuery.of(context).size;
          final double width = screenSize.width;

          // تحديد عدد الأعمدة بناءً على عرض الشاشة
          int crossAxisCount = width > 1200 ? 4 : (width > 800 ? 3 : 2);

          return GridView.builder(
            padding: EdgeInsets.all(constraints.maxWidth * 0.04),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.7, // لضبط تناسب الصور مع الشاشة
              crossAxisSpacing: constraints.maxWidth * 0.04,
              mainAxisSpacing: constraints.maxHeight * 0.02,
            ),
            itemCount: kidsProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: kidsProducts[index]);
            },
          );
        },
      ),
    );
  }
}
