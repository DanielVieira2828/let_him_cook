import 'package:flutter/material.dart';

class NameForm extends StatelessWidget {
  const NameForm({
    super.key,
    required this.nameController,
    required this.registerUser,
  });

  final TextEditingController nameController;
  final VoidCallback registerUser;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
