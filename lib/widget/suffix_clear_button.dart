import 'package:flutter/material.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

class SuffixClearButton extends StatelessWidget {
  const SuffixClearButton({super.key, required this.onPressed});

  final TextEditingController onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed.clear();
      },
      icon: Icon(
        Icons.clear,
        color: BootstrapColors().tertiary,
      ),
    );
  }
}
