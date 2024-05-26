import 'package:flutter/material.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add new product',
      onPressed: onPressed,
      // backgroundColor: Colors.lightGreen,
      backgroundColor: BootstrapColors().primary,
      child: Icon(
        Icons.add,
        color: BootstrapColors().light,
      ),
    );
  }
}
