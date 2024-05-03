import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';

class EnterForm extends StatelessWidget {
  const EnterForm({
    super.key,
    required this.onToggle,
  });

  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: onToggle,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  width: 190,
                  decoration: BoxDecoration(
                    color: secondarybackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  width: 190,
                  decoration: BoxDecoration(
                    color: secondarybackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "Criar uma conta",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
