import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelTxt;
  final String hintTxt;
  final dynamic validate;

  InputField({
    required this.labelTxt,
    required this.hintTxt,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        validator: validate,
        decoration: InputDecoration(hintText: hintTxt, labelText: labelTxt),
        onSaved: (value) {
          debugPrint('Enviando dados para api');
        },
      ),
    );
  }
}
