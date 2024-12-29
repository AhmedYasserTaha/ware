import 'package:flutter/material.dart';
import 'package:my_web_project/model/product_detail_page.dart';

// تعريف كلاس المنتج
class Product {
  final String name;
  final double price;
  final String imageUrl;
  final List<String> sizes;
  final String category;
  final double discount; // نسبة الخصم (مثل 20 = 20%)

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.category,
    this.discount = 0.0, // قيمة الخصم الافتراضية هي 0%
  });

  // دالة لحساب السعر بعد الخصم
  double getDiscountedPrice() {
    return price * (1 - discount / 100); // السعر بعد الخصم
  }

  // دالة لعرض الخصم كنسبة مئوية
  String getDiscountText() {
    return '${discount}% خصم'; // عرض الخصم كنسبة مئوية
  }
}

// تعريف كلاس الكارد لعرض المنتجات
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
                      Row(
                        children: [
                          // عرض الخصم كنسبة مئوية
                          Text(
                            product.getDiscountText(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (product.discount > 0) ...[
                            const SizedBox(width: 8),
                            // عرض السعر القديم مع خط عليه
                            Text(
                              '${product.price} جنيه',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ],
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
    imageUrl: 'images/w1.jpg',
    sizes: ['S', 'M', 'L', 'XL'],
    category: 'ملابس نسائية',
    discount: 20, // خصم 20%
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 400.0,
    imageUrl: 'images/w2.jpg',
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
    discount: 20, // خصم 20%
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 500.0,
    imageUrl: 'images/w2.jpg',
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
    discount: 15, // خصم 15%
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 600.0,
    imageUrl: 'images/w2.jpg',
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
    discount: 5, // خصم 5%
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 400.0,
    imageUrl: 'images/w2.jpg',
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
    discount: 10, // خصم 10%
  ),
  Product(
    name: 'بلوزة كاجوال',
    price: 400.0,
    imageUrl: 'images/w2.jpg',
    sizes: ['S', 'M', 'L'],
    category: 'ملابس نسائية',
    discount: 0, // بدون خصم
  ),
];

final List<Product> kidsProducts = [
  Product(
    name: 'طقم أطفال رياضي',
    price: 400.0,
    imageUrl: 'images/b1.jpg',
    sizes: ['2-3Y', '4-5Y', '6-7Y'],
    category: 'ملابس أطفال',
    discount: 5, // خصم 5%
  ),
];

final List<Product> shoesProducts = [
  Product(
    name: 'حذاء رياضي',
    price: 400.0,
    imageUrl: 'images/w1.jpg',
    sizes: ['38', '39', '40', '41', '42'],
    category: 'أحذية',
    discount: 10, // خصم 10%
  ),
];

final List<Product> bagsProducts = [
  Product(
    name: 'حقيبة يد كلاسيكية',
    price: 400.0,
    imageUrl: 'images/pag1.jpg',
    sizes: ['وسط', 'كبير'],
    category: 'حقائب',
    discount: 0, // بدون خصم
  ),
];
