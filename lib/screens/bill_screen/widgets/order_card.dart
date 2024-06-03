import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/models/order_model.dart';

class BillOrderCard extends StatelessWidget {
  const BillOrderCard({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Items do pedido:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              Text(
                "Status do pedido: ${order.state}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: order.dishes.length,
            itemBuilder: (context, index) {
              final dish = order.dishes[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dish.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  Text(
                    dish.quantity.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Preço: R\$ ${order.totalPrice.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
