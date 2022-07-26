import 'package:flutter/material.dart';
import 'package:formy/validator.dart';

class ConfirmacaoField extends StatelessWidget {
  const ConfirmacaoField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        decoration: const InputDecoration(labelText: 'Confirme sua senha'),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: Validator.validateConfirmacao,
        onSaved: (value) {
          debugPrint('enviando dados para api');
        },
      ),
    );
  }
}