import 'package:flutter/material.dart';

import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/models/bill_model.dart';
import 'package:let_him_cook/screens/bill_screen/widgets/order_card.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({
    super.key,
    required this.userBill,
  });

  final Bill userBill;

  @override
  Widget build(BuildContext context) {
    double totalBillValue = userBill.calculateTotalBillValue();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: primaryColor,
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: 700,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: userBill.orders.length,
                  itemBuilder: (context, index) {
                    return BillOrderCard(
                      order: userBill.orders[index],
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
                      onPressed: () {},
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
                        "FECHAR CONTA",
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
    );
  }
}
