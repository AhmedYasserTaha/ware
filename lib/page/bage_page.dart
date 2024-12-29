import 'package:flutter/material.dart';
import 'package:my_web_project/widget/widgets_product_card.dart';

class BagsPage extends StatelessWidget {
  const BagsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حقائب'),
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
        itemCount: bagsProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: bagsProducts[index]);
        },
      ),
    );
  }
}
