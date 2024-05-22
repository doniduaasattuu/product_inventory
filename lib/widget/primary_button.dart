import 'package:flutter/material.dart';
import 'package:product_inventory/models/bootstrap_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.buttonText, required this.buttonOnPressed});

  final void Function()? buttonOnPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonOnPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          BootstrapColors().primary,
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
        ),
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
