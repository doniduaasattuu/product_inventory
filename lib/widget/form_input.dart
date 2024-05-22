import 'package:flutter/material.dart';
import 'package:product_inventory/models/bootstrap_colors.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.inputLabel,
    required this.inputController,
    this.inputValidator,
    this.secure = false,
  });

  final String inputLabel;
  final TextEditingController inputController;
  final String? Function(String?)? inputValidator;
  final bool secure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      controller: inputController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BootstrapColors().light),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BootstrapColors().danger),
        ),
        labelText: inputLabel,
      ),
      validator: inputValidator,
    );
  }
}
