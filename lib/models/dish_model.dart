class Dish {
  const Dish({
    required this.uuid,
    required this.name,
    required this.price,
    required this.description,
    required this.ingredients,
  });

  final String uuid;
  final String name;
  final double price;
  final List<String> ingredients;
  final String description;
}
