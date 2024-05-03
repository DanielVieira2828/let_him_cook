import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/screens/order_screen/order_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.onToggle,
  });

  final VoidCallback onToggle;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController cpfController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: widget.onToggle,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor),
            shape: MaterialStatePropertyAll(
              CircleBorder(),
            ),
          ),
          icon: const Icon(
            Icons.arrow_back,
            color: secondaryColor,
            size: 30,
          ),
        ),
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Insira seu CPF",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                style: const TextStyle(fontSize: 40, color: secondaryColor),
                controller: cpfController,
                enabled: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: secondarybackground,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const OrderScreen(),
                        ),
                        (route) => false);
                  },
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
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
