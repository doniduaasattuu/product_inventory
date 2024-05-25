import 'package:flutter/material.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.buttonText,
    required this.buttonOnPressed,
    this.buttonIcon,
  });

  final void Function()? buttonOnPressed;
  final String buttonText;
  final Icon? buttonIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: buttonIcon,
      onPressed: buttonOnPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        backgroundColor: BootstrapColors().primary,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        // padding: WidgetStateProperty.all(
        //   const EdgeInsets.symmetric(
        //     horizontal: 10,
        //     vertical: 8,
        //   ),
        // ),
      ),
      label: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );

    // return ElevatedButton(
    //   onPressed: buttonOnPressed,
    // style: ButtonStyle(
    //   shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    //     const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(8),
    //       ),
    //     ),
    //   ),
    //   backgroundColor: WidgetStateProperty.all(
    //     BootstrapColors().primary,
    //   ),
    //   padding: WidgetStateProperty.all(
    //     const EdgeInsets.symmetric(
    //       horizontal: 20,
    //       vertical: 8,
    //     ),
    //   ),
    // ),
    //   child: Text(
    //     buttonText,
    //     textAlign: TextAlign.center,
    //     style: const TextStyle(
    //       color: Colors.white,
    //       fontSize: 18,
    //     ),
    //   ),
    // );
  }
}
