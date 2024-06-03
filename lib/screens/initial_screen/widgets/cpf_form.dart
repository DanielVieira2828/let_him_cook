import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:let_him_cook/constants.dart';

class CpfForm extends StatelessWidget {
  const CpfForm({
    super.key,
    required this.cpfController,
    required this.onToggle,
  });

  final TextEditingController cpfController;
  final VoidCallback onToggle;

  bool validarCPF(String cpf) {
    // Remove todos os caracteres não numéricos
    cpf = cpf.replaceAll(RegExp(r'\D'), '');

    // Verifica se o CPF tem 11 dígitos
    if (cpf.length != 11) {
      return false;
    }

    // Verifica se todos os dígitos são iguais, como "111.111.111-11"
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
      return false;
    }

    // Calcula o primeiro dígito verificador
    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    int primeiroDigitoVerificador = 11 - (soma % 11);
    if (primeiroDigitoVerificador >= 10) {
      primeiroDigitoVerificador = 0;
    }

    // Verifica o primeiro dígito verificador
    if (primeiroDigitoVerificador != int.parse(cpf[9])) {
      return false;
    }

    // Calcula o segundo dígito verificador
    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    int segundoDigitoVerificador = 11 - (soma % 11);
    if (segundoDigitoVerificador >= 10) {
      segundoDigitoVerificador = 0;
    }

    // Verifica o segundo dígito verificador
    if (segundoDigitoVerificador != int.parse(cpf[10])) {
      return false;
    }

    return true;
  }

  void _onPressed(BuildContext context) {
    final cpf = cpfController.text;
    if (validarCPF(cpf)) {
      onToggle();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('CPF inválido. Por favor, insira um CPF válido.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
            style: const TextStyle(fontSize: 30, color: secondaryColor),
            enabled: true,
            controller: cpfController,
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
            height: 32,
          ),
          SizedBox(
            width: double.infinity,
            height: 130,
            child: ElevatedButton(
              onPressed: () => _onPressed(context),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(onBackground),
                shape: WidgetStatePropertyAll(
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
    );
  }
}
