import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/models/dish_on_order.dart';
import 'package:let_him_cook/models/order_model.dart';
import 'package:let_him_cook/screens/order_screen/widget/order_dish_card.dart';

class OrderModal extends StatefulWidget {
  const OrderModal({
    super.key,
    required this.orderedDishes,
    required this.addOrderToBill,
  });

  final List<DishOnOrder> orderedDishes;
  final Function addOrderToBill;

  @override
  State<OrderModal> createState() => _OrderModalState();
}

class _OrderModalState extends State<OrderModal> {
  double total = 0.00;

  @override
  void initState() {
    total = calculateTotal(widget.orderedDishes);
    super.initState();
  }

  double calculateTotal(List<DishOnOrder> dishes) {
    double total = 0.0;
    for (var dish in dishes) {
      total += dish.price * dish.quantity;
    }
    return total;
  }

  sumQuantity(DishOnOrder dish) {
    setState(() {
      for (int i = 0; i < widget.orderedDishes.length; i++) {
        if (widget.orderedDishes[i].uuid == dish.uuid) {
          DishOnOrder updatedDish = DishOnOrder(
            uuid: dish.uuid,
            image: dish.image,
            category: dish.category,
            name: dish.name,
            price: dish.price,
            description: dish.description,
            quantity: dish.quantity + 1,
          );

          widget.orderedDishes[i] = updatedDish;
          total = calculateTotal(widget.orderedDishes); // Atualiza o total
          break;
        }
      }
    });
  }

  subQuantity(DishOnOrder dish) {
    setState(() {
      for (int i = 0; i < widget.orderedDishes.length; i++) {
        if (widget.orderedDishes[i].uuid == dish.uuid) {
          if (widget.orderedDishes[i].quantity > 1) {
            DishOnOrder updatedDish = DishOnOrder(
              uuid: dish.uuid,
              image: dish.image,
              category: dish.category,
              name: dish.name,
              price: dish.price,
              description: dish.description,
              quantity: dish.quantity - 1,
            );

            widget.orderedDishes[i] = updatedDish;
          } else {
            widget.orderedDishes.removeAt(i);
          }
          total = calculateTotal(widget.orderedDishes); // Atualiza o total
          break;
        }
      }
    });
  }

  delQuantity(DishOnOrder dish) {
    setState(() {
      widget.orderedDishes.removeWhere((item) => item.uuid == dish.uuid);
      total = calculateTotal(widget.orderedDishes); // Atualiza o total
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
      width: 800,
      height: 800,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.orderedDishes.length,
                itemBuilder: (context, index) {
                  return OrderDishCard(
                    orderedDish: widget.orderedDishes[index],
                    sumQuantity: () {
                      sumQuantity(widget.orderedDishes[index]);
                    },
                    subQuantity: () {
                      subQuantity(widget.orderedDishes[index]);
                    },
                    delQuantity: () {
                      delQuantity(widget.orderedDishes[index]);
                    },
                  );
                },
              ),
            ),
            const Divider(
              thickness: 2,
              color: secondaryColor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total: R\$ ${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.addOrderToBill();
                    },
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 24,
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
                      "CONFIRMAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
