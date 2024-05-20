import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({super.key, required this.label, this.secure = false});

  final String label;
  final bool secure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      validator: (String? value) {
        return (value != null && value.contains('@'))
            ? 'Do not use the @ char.'
            : null;
      },
    );
  }
}
