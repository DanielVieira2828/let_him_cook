import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/models/bill_model.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: primaryColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
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
