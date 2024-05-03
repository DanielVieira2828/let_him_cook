import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/screens/initial_screen/widgets/enter_form.dart';
import 'package:let_him_cook/screens/initial_screen/widgets/login_screen.dart';
import 'package:let_him_cook/widgets/form_field.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool showLoginForm =
      false; // Adicionado para controlar a exibição do LoginForm

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  // Método para alternar entre EnterForm e LoginScreen
  void toggleScreen() {
    setState(() {
      showLoginForm = !showLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(color: background),
              child: AnimatedSwitcher(
                // AnimatedSwitcher para animar a transição
                duration: const Duration(milliseconds: 500),
                child: showLoginForm
                    ? LoginForm(
                        onToggle: toggleScreen,
                      ) // Se showLoginForm for true, exiba LoginScreen
                    : EnterForm(
                        onToggle: toggleScreen), // Senão, exiba EnterForm
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
