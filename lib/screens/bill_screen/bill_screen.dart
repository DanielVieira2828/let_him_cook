import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/models/bill_model.dart';
import 'package:let_him_cook/screens/bill_screen/bill_closed.dart';
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

    Route createFadeRoute(Widget page) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final fadeAnimation = animation.drive(tween);

          return FadeTransition(
            opacity: fadeAnimation,
            child: child,
          );
        },
      );
    }

    void confirmCloseBill(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 600,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Tem certeza que deseja fechar a conta?",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
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
                          "CANCELAR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          Navigator.of(context).pushReplacement(
                            createFadeRoute(
                              BillClosedScreen(
                                userBill: userBill,
                              ),
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
                ],
              ),
            ),
          );
        },
      );
    }

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
                      onPressed: () {
                        confirmCloseBill(context);
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
