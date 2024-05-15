import 'package:flutter/cupertino.dart';
import 'package:let_him_cook/models/dish_on_order.dart';

class OrderDishCard extends StatelessWidget {
  const OrderDishCard({
    super.key,
    required this.orderedDish,
  });

  final DishOnOrder orderedDish;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(
          orderedDish.image,
          width: 50,
          height: 50,
        ),
        Text(orderedDish.name),
        Text(
          orderedDish.price.toStringAsFixed(2),
        ),
        Text(
          orderedDish.quantity.toString(),
        ),
      ],
    );
  }
}
