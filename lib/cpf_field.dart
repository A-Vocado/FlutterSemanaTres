import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formy/validator.dart';

class CpfField extends StatelessWidget {
  const CpfField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: Validator.validateCPF,
        decoration:
            const InputDecoration(hintText: '000.000.000-00', labelText: 'CPF'),
        onSaved: (value) {
          debugPrint('enviando dados para api');
        },
      ),
    );
  }
}
