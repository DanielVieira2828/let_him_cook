class Dish {
  const Dish({
    required this.uuid,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
  });

  final String uuid;
  final String image;
  final String category;
  final String name;
  final double price;
  final String description;
}
