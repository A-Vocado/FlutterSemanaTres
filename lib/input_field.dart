import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.labelTxt,
    required this.hintTxt,
    required this.validate,
    this.icon,
    this.keyboardNumbers,
    required this.maskFormatter,
  }) : super(key: key);

  final String labelTxt;
  final String hintTxt;
  final dynamic validate;
  final Widget? icon;
  final keyboardNumbers;
  final List<TextInputFormatter>? maskFormatter;

  final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        inputFormatters: maskFormatter,
        validator: validate,
        keyboardType: keyboardNumbers,
        decoration: InputDecoration(
          border: border,
          isDense: true,
          hintText: hintTxt,
          labelText: labelTxt,
          prefixIcon: icon,
        ),
        onSaved: (value) {
          debugPrint('Enviando dados para api');
        },
      ),
    );
  }
}
