import 'package:let_him_cook/models/dish_on_order.dart';

class Order {
  const Order({
    required this.uuid,
    required this.clientUuid,
    required this.table,
    required this.totalPrice,
    required this.dishes,
    required this.state,
  });

  final String uuid;
  final String clientUuid;
  final int table;
  final double totalPrice;
  final List<DishOnOrder> dishes;
  final String state;
}
