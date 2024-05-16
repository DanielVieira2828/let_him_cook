import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:let_him_cook/constants.dart';
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
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 1,
              blurRadius: 3,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  orderedDish.image,
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      orderedDish.name,
                      style: const TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "R\$ ${orderedDish.price.toStringAsFixed(2)} ",
                      style: const TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  sumQuantity();
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                orderedDish.quantity.toString(),
                style: const TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              IconButton(
                onPressed: () {
                  subQuantity();
                },
                icon: const Icon(
                  Icons.remove,
                  size: 30,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              IconButton(
                onPressed: () {
                  delQuantity();
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
