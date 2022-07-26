import 'package:flutter/material.dart';
import 'package:formy/validator.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        decoration: const InputDecoration(labelText: 'senha'),
        keyboardType: TextInputType.visiblePassword,
        validator: Validator.validateSenha,
        onSaved: (value) {
          debugPrint('enviando dados para api');
        },
      ),
    );
  }
}