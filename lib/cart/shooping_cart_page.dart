import 'package:flutter/material.dart';
import 'package:my_web_project/cart/shooping_cart.dart';

class ShoppingCartPage extends StatelessWidget {
  final ShoppingCart shoppingCart;

  const ShoppingCartPage({Key? key, required this.shoppingCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عربة التسوق'),
      ),
      body: Column(
        children: [
          shoppingCart.items.isEmpty
              ? const Center(child: Text('عربة التسوق فارغة'))
              : Expanded(
                  child: ListView.builder(
                    itemCount: shoppingCart.items.length,
                    itemBuilder: (context, index) {
                      var product = shoppingCart.items[index];
                      return ListTile(
                        leading: Image.asset(product.imageUrl,
                            width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(product.name),
                        subtitle: Text('${product.price} جنيه'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_shopping_cart),
                          onPressed: () {
                            shoppingCart.removeProduct(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
          if (shoppingCart.items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'إجمالي السعر: ${shoppingCart.totalPrice} جنيه',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
