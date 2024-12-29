import 'package:flutter/material.dart';
import 'package:my_web_project/widget/widgets_product_card.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أحذية'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // التنقل إلى عربة التسوق
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: shoesProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: shoesProducts[index]);
        },
      ),
    );
  }
}
