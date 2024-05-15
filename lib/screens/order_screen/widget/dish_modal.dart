import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/models/dish_model.dart';

class DishModal extends StatelessWidget {
  const DishModal({super.key, required this.dish, required this.addDish});

  final Dish dish;
  final Function(Dish) addDish;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor,
          width: 5,
        ),
      ),
      height: 570,
      width: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            dish.image,
            width: 175,
            height: 175,
          ),
          Text(
            dish.name,
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "R\$ ${dish.price.toStringAsFixed(2)}",
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            dish.description,
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addDish(dish);
            },
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(onBackground),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            child: const Text(
              "Adicionar ao pedido",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
