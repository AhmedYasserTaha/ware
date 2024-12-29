import 'package:flutter/material.dart';
import 'package:my_web_project/widget/product_card.dart'; // تأكد من استيراد الكود الخاص بالكارت

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        // لجعل المحتوى في منتصف الشاشة
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // لجعل المحتوى في المنتصف عمودياً
              crossAxisAlignment:
                  CrossAxisAlignment.center, // لجعل المحتوى في المنتصف أفقياً
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *
                      0.4, // تقليل ارتفاع الصورة لتناسب العرض
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
                  textAlign: TextAlign.center, // محاذاة النص في المنتصف
                ),
                const SizedBox(height: 8),
                // عرض السعر بعد الخصم
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // محاذاة العناصر في المنتصف أفقياً
                  children: [
                    // عرض السعر الجديد بعد الخصم
                    Text(
                      '${product.getDiscountedPrice().toStringAsFixed(2)} جنيه',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
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
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'الفئة: ${product.category}',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center, // محاذاة النص في المنتصف
                ),
                const SizedBox(height: 16),
                // عرض المقاسات المتاحة
                Text(
                  'المقاسات المتاحة:',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // محاذاة النص في المنتصف
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // محاذاة المقاسات في المنتصف
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
                  child: const Text(
                    'خد اسكرين وابعتها على رقم \n      01002240339',
                    textAlign: TextAlign.center, // محاذاة النص في المنتصف
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
