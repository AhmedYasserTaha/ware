import 'package:flutter/material.dart';
import 'package:my_web_project/model/product_detail_page.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl; // هنا ستستخدم الصور المحلية
  final List<String> sizes;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.category,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Size screenSize = MediaQuery.of(context).size;
        final double width = screenSize.width;

        // تحديد عدد الأعمدة بناءً على عرض الشاشة
        int crossAxisCount = width > 1200 ? 4 : (width > 800 ? 3 : 2);

        return Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          product.imageUrl), // استخدام الصورة المحلية هنا
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${product.price} جنيه',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // عرض المقاسات المتاحة
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: product.sizes
                              .map((size) => Container(
                                    margin: const EdgeInsets.only(right: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      size,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // التنقل إلى صفحة تفاصيل المنتج
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: product),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 36),
                        ),
                        child: const Text('عرض التفاصيل'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// بيانات المنتجات لكل فئة
final List<Product> womenProducts = [
  Product(
    name: 'فستان صيفي',
    price: 200.0,
    imageUrl: 'images/w1.jpg', // مسار الصورة المحلية
    sizes: ['S', 'M', 'L', 'XL'],
    category: 'ملابس نسائية',
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 199.99,
    imageUrl: 'images/w2.jpg', // مسار الصورة المحلية
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 199.99,
    imageUrl: 'images/w2.jpg', // مسار الصورة المحلية
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 199.99,
    imageUrl: 'images/w2.jpg', // مسار الصورة المحلية
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 199.99,
    imageUrl: 'images/w2.jpg', // مسار الصورة المحلية
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 199.99,
    imageUrl: 'images/w2.jpg', // مسار الصورة المحلية
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
  ),
];

final List<Product> kidsProducts = [
  Product(
    name: 'طقم أطفال رياضي',
    price: 299.99,
    imageUrl: 'images/b1.jpg', // مسار الصورة المحلية
    sizes: ['2-3Y', '4-5Y', '6-7Y'],
    category: 'ملابس أطفال',
  ),
];

final List<Product> shoesProducts = [
  Product(
    name: 'حذاء رياضي',
    price: 599.99,
    imageUrl: 'images/w1.jpg', // مسار الصورة المحلية
    sizes: ['38', '39', '40', '41', '42'],
    category: 'أحذية',
  ),
];

final List<Product> bagsProducts = [
  Product(
    name: 'حقيبة يد كلاسيكية',
    price: 799.99,
    imageUrl: 'images/pag1.jpg', // مسار الصورة المحلية
    sizes: ['وسط', 'كبير'],
    category: 'حقائب',
  ),
];
