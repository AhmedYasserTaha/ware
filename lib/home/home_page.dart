import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String selectedCategory;

  const HomePage({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(selectedCategory == 'الكل' ? 'كل المنتجات' : selectedCategory),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // التنقل إلى صفحة عربة التسوق
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'الفئات',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('ملابس رجالية'),
              leading: const Icon(Icons.person),
              onTap: () => _navigateToCategory(context, 'ملابس رجالية'),
            ),
            ListTile(
              title: const Text('ملابس نسائية'),
              leading: const Icon(Icons.person_outline),
              onTap: () => _navigateToCategory(context, 'ملابس نسائية'),
            ),
            ListTile(
              title: const Text('ملابس أطفال'),
              leading: const Icon(Icons.child_care),
              onTap: () => _navigateToCategory(context, 'ملابس أطفال'),
            ),
            ListTile(
              title: const Text('أحذية'),
              leading: const Icon(Icons.shopping_bag),
              onTap: () => _navigateToCategory(context, 'أحذية'),
            ),
            ListTile(
              title: const Text('حقائب'),
              leading: const Icon(Icons.work),
              onTap: () => _navigateToCategory(context, 'حقائب'),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          // فلترة المنتجات حسب الفئة المختارة
          if (selectedCategory == 'الكل' ||
              products[index].category == selectedCategory) {
            return ProductCard(product: products[index]);
          }
          return null;
        },
      ),
    );
  }

  void _navigateToCategory(BuildContext context, String category) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(selectedCategory: category),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
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
                ),
                const SizedBox(height: 4),
                Text(
                  '${product.price} جنيه',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // إضافة المنتج إلى عربة التسوق
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 36),
                  ),
                  child: const Text('أضف إلى السلة'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// بيانات المنتجات للعرض
final List<Product> products = [
  Product(
    name: 'قميص رجالي',
    price: 299.99,
    imageUrl: 'https://placeholder.com/shirt',
    category: 'ملابس رجالية',
  ),
  Product(
    name: 'فستان',
    price: 399.99,
    imageUrl: 'https://placeholder.com/dress',
    category: 'ملابس نسائية',
  ),
  // يمكنك إضافة المزيد من المنتجات هنا
];
