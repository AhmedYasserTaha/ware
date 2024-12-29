class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final List<String> sizes;
  final List<String> colors;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.sizes,
    required this.colors,
  });
}
