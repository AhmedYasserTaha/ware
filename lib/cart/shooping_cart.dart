import 'package:my_web_project/home/home_page.dart';

class ShoppingCart {
  List<Product> _items = [];

  List<Product> get items => _items;

  void addProduct(Product product) {
    _items.add(product);
  }

  void removeProduct(Product product) {
    _items.remove(product);
  }

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }
}
