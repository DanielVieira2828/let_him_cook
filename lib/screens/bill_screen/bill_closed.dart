import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/models/bill_model.dart';
import 'package:let_him_cook/screens/bill_screen/widgets/order_card.dart';
import 'package:let_him_cook/screens/initial_screen/initial_screen.dart';

class BillClosedScreen extends StatefulWidget {
  const BillClosedScreen({super.key, required this.userBill});

  final Bill userBill;

  @override
  State<BillClosedScreen> createState() => _BillClosedScreenState();
}

class _BillClosedScreenState extends State<BillClosedScreen> {
  double totalBillValue = 0.00;

  @override
  void initState() {
    super.initState();
    totalBillValue = widget.userBill.calculateTotalBillValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                width: 700,
                child: Column(
                  children: [
                    const Text(
                      "CONTA",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: secondaryColor,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: widget.userBill.orders.length,
                        itemBuilder: (context, index) {
                          return BillOrderCard(
                            order: widget.userBill.orders[index],
                          );
                        },
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: secondaryColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total: R\$ ${totalBillValue.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const InitialScreen(),
                                ),
                              );
                            },
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 24,
                                ),
                              ),
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
                              "Sair",
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
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Um de nossos funcionários está vindo para que você possa efetuar o pagamento. ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Agradecemos a sua presença! ",
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
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
