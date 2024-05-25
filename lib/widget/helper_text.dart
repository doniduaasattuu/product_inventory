import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

// ignore: must_be_immutable
class HelperText extends StatelessWidget {
  HelperText(
      {super.key,
      required this.mainText,
      this.linkText,
      required this.actionLink});

  String mainText;
  String? linkText;
  Widget actionLink;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$mainText ',
            style: TextStyle(color: BootstrapColors().secondary),
          ),
          TextSpan(
            text: '$linkText',
            style: TextStyle(
              color: BootstrapColors().primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => actionLink,
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
