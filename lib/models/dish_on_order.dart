import 'package:let_him_cook/models/dish_model.dart';

class DishOnOrder {
  const DishOnOrder({
    required this.uuid,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.quantity,
  });

  final String uuid;
  final String image;
  final String category;
  final String name;
  final double price;
  final String description;
  final int quantity;

  factory DishOnOrder.fromDish(Dish dish) {
    return DishOnOrder(
      uuid: dish.uuid,
      image: dish.image,
      category: dish.category,
      name: dish.name,
      price: dish.price,
      description: dish.description,
      quantity: 1,
    );
  }
}
