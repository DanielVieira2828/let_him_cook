import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
            width: 250,
            child: Container(
              color: secondarybackground,
              child: const Column(),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.network(
                              "https://img.freepik.com/fotos-gratis/hamburguer-saboroso-isolado-no-fundo-branco-fastfood-de-hamburguer-fresco-com-carne-e-queijo_90220-1063.jpg",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200, // Adjust height as needed
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: onBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Item $index',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: background,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
