import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.changePage,
    required this.category,
  });

  final VoidCallback changePage;
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: changePage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
