import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:let_him_cook/constants.dart';
import 'package:let_him_cook/screens/initial_screen/widgets/cpf_form.dart';
import 'package:let_him_cook/screens/initial_screen/widgets/name_form.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({
    super.key,
  });

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool showNameForm = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  void checkUserRegister() {
    setState(() {
      showNameForm = !showNameForm;
    });
  }

  void registerUser() {
    setState(() {
      showNameForm = !showNameForm;
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
                  duration: const Duration(milliseconds: 500),
                  child: showNameForm
                      ? NameForm(
                          nameController: nameController,
                          registerUser: registerUser)
                      : CpfForm(
                          cpfController: cpfController,
                          onToggle: checkUserRegister)),
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
