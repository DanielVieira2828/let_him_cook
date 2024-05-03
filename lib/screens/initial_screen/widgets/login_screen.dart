import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/widgets/form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(color: background),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LHCFormField(
                    label: "Insira seu CPF",
                    controller: cpfController,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(color: primaryColor),
              child: Center(
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
