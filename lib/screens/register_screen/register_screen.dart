import 'package:flutter/material.dart';
import 'package:let_him_cook/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          color: background,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            TextField(
              style: const TextStyle(fontSize: 40, color: secondaryColor),
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
              height: 16,
            ),
            TextField(
              style: const TextStyle(fontSize: 40, color: secondaryColor),
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
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
