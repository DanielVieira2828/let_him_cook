import 'package:flutter/cupertino.dart';
import 'package:let_him_cook/models/dish_on_order.dart';

class OrderDishCard extends StatelessWidget {
  const OrderDishCard({
    super.key,
    required this.orderedDish,
    required this.sumQuantity,
    required this.subQuantity,
    required this.delQuantity,
  });

  final DishOnOrder orderedDish;
  final Function sumQuantity;
  final Function subQuantity;
  final Function delQuantity;

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
