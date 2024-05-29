import 'package:flutter/material.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

class SuffixClearButton extends StatelessWidget {
  const SuffixClearButton(
      {super.key, required this.controller, this.onPressed});

  final TextEditingController controller;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.clear();
        onPressed!();
      },
      icon: Icon(
        Icons.clear,
        color: BootstrapColors().tertiary,
      ),
    );
  }
}
