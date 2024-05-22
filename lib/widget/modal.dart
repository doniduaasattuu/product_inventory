import 'package:flutter/material.dart';
import 'package:product_inventory/models/bootstrap_colors.dart';

// ignore: must_be_immutable
class Modal extends StatelessWidget {
  Modal({
    super.key,
    required this.modalMessage,
    this.modalVariant = 'danger',
    this.modalButton = 'Close',
  });

  String modalMessage;
  String modalVariant;
  String modalButton;
  Color variant = BootstrapColors().danger;

  @override
  Widget build(BuildContext context) {
    if (modalVariant == 'success') {
      variant = BootstrapColors().success;
    } else if (modalVariant == 'info') {
      variant = BootstrapColors().info;
    } else if (modalVariant == 'warning') {
      variant = BootstrapColors().warning;
    }

    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.info),
          SizedBox(width: 5),
          Text(
            'Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      content: Text(
        modalMessage,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: variant,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
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
            modalButton,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
