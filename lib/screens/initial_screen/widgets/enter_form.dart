import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/screens/initial_screen/login_screen.dart';

class EnterForm extends StatelessWidget {
  const EnterForm({
    super.key,
    required this.onToggle,
  });

  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 180,
          child: ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
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
              "ENTRAR",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              "OU",
              style: TextStyle(
                fontSize: 25,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: onToggle,
          style: const ButtonStyle(
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
            "ENTRAR COM UMA CONTA",
            style: TextStyle(
              color: secondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
