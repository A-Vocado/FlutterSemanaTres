import 'package:flutter/material.dart';
import 'package:formy/validator.dart';

class BirthField extends StatelessWidget {
  const BirthField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: Validator.validateBirth,
        decoration: const InputDecoration(
            hintText: 'dd/mmm/aaaa', labelText: 'Data de Nascimento'),
        onSaved: (value) {
          debugPrint('enviando dados para api');
        },
      ),
    );
  }
}
