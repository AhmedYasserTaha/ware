import 'package:flutter/material.dart';
import 'package:my_web_project/widget/widgets_product_card.dart'; // تأكد من استيراد الكود الخاص بالكارت

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // التنقل إلى عربة التسوق
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${product.price} جنيه',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'الفئة: ${product.category}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              // عرض المقاسات المتاحة
              Text(
                'المقاسات المتاحة:',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: product.sizes
                      .map((size) => Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              size,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 16),
              // زر إضافة إلى السلة
              ElevatedButton(
                onPressed: () {
                  // إضافة المنتج إلى السلة أو القيام بإجراء آخر
                },
                child: const Text('إضافة إلى السلة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
