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
        decoration: const InputDecoration(labelText: 'Nome'),
        keyboardType: TextInputType.name,
        validator: Validator.validateNome,
        onSaved: (value) {
          debugPrint('enviando dados para api');
        },
      ),
    );
  }
}