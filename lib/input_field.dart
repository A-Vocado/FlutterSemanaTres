import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.labelTxt,
    required this.hintTxt,
    required this.validate,
    this.icon,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
  }) : super(key: key);
  final String labelTxt;
  final String hintTxt;
  final dynamic validate;
  final Widget? icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(        
        textCapitalization: textCapitalization != null
            ? textCapitalization!
            : TextCapitalization.none,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validate,
        decoration: InputDecoration(
            hintText: hintTxt, labelText: labelTxt, prefixIcon: icon),
        onSaved: (value) {
          debugPrint('Enviando dados para api');
        },
      ),
    );
  }
}
