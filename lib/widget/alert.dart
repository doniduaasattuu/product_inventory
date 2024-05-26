import 'package:flutter/material.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

class Alert extends StatelessWidget {
  const Alert(
      {super.key, required this.ctx, this.title, this.content, this.action});

  final BuildContext ctx;
  final String? title;
  final String? content;
  final String? action;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        side: BorderSide(color: BootstrapColors().tertiary),
      ),
      title: Text(title ?? 'Information'),
      content: Text(content ?? 'Error occured.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(BootstrapColors().primary),
          ),
          child: Text(
            action ?? 'Okay',
            style: TextStyle(
              color: BootstrapColors().light,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
