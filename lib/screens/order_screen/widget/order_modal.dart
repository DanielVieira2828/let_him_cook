import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/models/dish_on_order.dart';
import 'package:let_him_cook/screens/order_screen/widget/order_dish_card.dart';

class OrderModal extends StatefulWidget {
  const OrderModal({
    super.key,
    required this.orderedDishes,
  });

  final List<DishOnOrder> orderedDishes;

  @override
  State<OrderModal> createState() => _OrderModalState();
}

class _OrderModalState extends State<OrderModal> {
  List<DishOnOrder> dishes = [];

  @override
  void initState() {
    dishes = widget.orderedDishes;
    super.initState();
  }

  sumQuantity(DishOnOrder dish) {
    setState(() {
      for (int i = 0; i < dishes.length; i++) {
        if (dishes[i].uuid == dish.uuid) {
          DishOnOrder updatedDish = DishOnOrder(
            uuid: dish.uuid,
            image: dish.image,
            category: dish.category,
            name: dish.name,
            price: dish.price,
            description: dish.description,
            quantity: dish.quantity + 1,
          );

          dishes[i] = updatedDish;
          break;
        }
      }
    });
  }

  subQuantity(DishOnOrder dish) {
    setState(() {
      for (int i = 0; i < dishes.length; i++) {
        if (dishes[i].uuid == dish.uuid) {
          if (dishes[i].quantity > 1) {
            DishOnOrder updatedDish = DishOnOrder(
              uuid: dish.uuid,
              image: dish.image,
              category: dish.category,
              name: dish.name,
              price: dish.price,
              description: dish.description,
              quantity: dish.quantity - 1,
            );

            dishes[i] = updatedDish;
          } else {
            dishes.removeAt(i);
          }
          break;
        }
      }
    });
  }

  delQuantity(DishOnOrder dish) {
    setState(() {
      dishes.removeWhere((item) => item.uuid == dish.uuid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 6,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 500,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dishes.length,
              itemBuilder: (context, index) {
                return OrderDishCard(
                  orderedDish: dishes[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
