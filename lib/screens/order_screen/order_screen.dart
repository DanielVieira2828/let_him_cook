import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/dummyData/dummy_dishes.dart';
import 'package:let_him_cook/models/bill_model.dart';
import 'package:let_him_cook/models/dish_model.dart';
import 'package:let_him_cook/models/dish_on_order.dart';
import 'package:let_him_cook/models/order_model.dart';
import 'package:let_him_cook/screens/bill_screen/bill_screen.dart';
import 'package:let_him_cook/screens/order_screen/widget/dish_cards.dart';
import 'package:let_him_cook/screens/order_screen/widget/dish_modal.dart';
import 'package:let_him_cook/screens/order_screen/widget/menu_items.dart';
import 'package:badges/badges.dart' as badges;
import 'package:let_him_cook/screens/order_screen/widget/order_modal.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late Bill userBill =
      const Bill(uuid: "", clientUuid: "", table: 1, orders: []);
  List<DishOnOrder> orderedDishes = [];
  List<Dish> dishes = [];
  String category = "Lanche";

  @override
  void initState() {
    dishes = dishList;
    category = "Lanche";
    super.initState();
  }

  void createOrderAndAddToBill(List<DishOnOrder> orderedDishes) {
    double totalPrice = orderedDishes.fold(0,
        (previousValue, dish) => previousValue + (dish.quantity * dish.price));

    String orderUuid = "";

    Order order = Order(
      uuid: orderUuid,
      clientUuid: userBill.clientUuid,
      table: userBill.table,
      totalPrice: totalPrice,
      dishes: orderedDishes,
    );

    setState(() {
      userBill = userBill.addOrder(order);
      orderedDishes.clear();
    });
  }

  void addToOrderedDishes(Dish dish) {
    bool found = false;
    for (int i = 0; i < orderedDishes.length; i++) {
      if (orderedDishes[i].uuid == dish.uuid) {
        setState(() {
          found = true;
          orderedDishes[i] = DishOnOrder(
            uuid: dish.uuid,
            image: dish.image,
            category: dish.category,
            name: dish.name,
            price: dish.price,
            description: dish.description,
            quantity: orderedDishes[i].quantity + 1,
          );
        });
        Navigator.pop(context);
        break;
      }
    }
    if (!found) {
      setState(() {
        orderedDishes.add(
          DishOnOrder(
            uuid: dish.uuid,
            image: dish.image,
            category: dish.category,
            name: dish.name,
            price: dish.price,
            description: dish.description,
            quantity: 1, // Initial quantity is 1
          ),
        );
        Navigator.pop(context);
      });
    }
  }

  addDishDialog(Dish dish) {
    showDialog(
        barrierDismissible: true,
        context: context,
        useSafeArea: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: DishModal(
              dish: dish,
              addDish: addToOrderedDishes,
            ),
          );
        });
  }

  orderDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        useSafeArea: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: OrderModal(
              orderedDishes: orderedDishes,
              addOrderToBill: () {
                createOrderAndAddToBill(orderedDishes);
                orderedDishes = [];
                Navigator.pop(context);
              },
            ),
          );
        });
  }

  changeCategory(String newCategory) {
    if (category == newCategory) {
      return;
    } else {
      setState(() {
        category = newCategory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: Container(
          color: primaryColor,
          height: double.infinity,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: Container(
              color: secondarybackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        MenuItem(
                          changePage: () {
                            changeCategory("Lanche");
                          },
                          category: "Lanches",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        MenuItem(
                          changePage: () {
                            changeCategory("Bebida");
                          },
                          category: "Bebidas",
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BillScreen(
                          userBill: userBill,
                        ),
                      ));
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long,
                            color: Colors.white,
                            size: 70,
                          ),
                          Text(
                            "PEDIDOS",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                    bottom: 40,
                    left: 32,
                    right: 32,
                    top: 16,
                  ),
                  child: GridView.builder(
                    itemCount: dishes
                        .where((dish) => dish.category == category)
                        .length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      var filteredDishes = dishes
                          .where((dish) => dish.category == category)
                          .toList();
                      var dish = filteredDishes[index];
                      return DishCard(
                        dish: dish,
                        openDishModal: () {
                          addDishDialog(
                            dish,
                          );
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 32,
                  child: Stack(
                    children: [
                      badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                            badgeColor: primaryColor,
                            padding: EdgeInsets.all(8)),
                        badgeContent: Text(
                          orderedDishes.length.toString(),
                          style: const TextStyle(
                            color: secondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: SizedBox(
                          width: 175,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              orderDialog();
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(onBackground),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            child: const Text(
                              "FAZER PEDIDO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
