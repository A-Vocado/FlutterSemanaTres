import 'package:flutter/material.dart';
import 'package:formy/validator.dart';

class SenhaField extends StatelessWidget {
  const SenhaField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        decoration: const InputDecoration(labelText: 'Senha'),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: Validator.validateSenha,
        onSaved: (value) {
          debugPrint('enviando dados para api');
        },
      ),
    );
  }
}