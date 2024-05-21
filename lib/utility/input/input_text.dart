import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.label,
    required this.controller,
    this.secure = false,
    required this.validatorFunction,
  });

  final String label;
  final bool secure;
  final TextEditingController controller;
  final void Function() validatorFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      textAlign: TextAlign.left,
      // validator: validatorFunction,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
