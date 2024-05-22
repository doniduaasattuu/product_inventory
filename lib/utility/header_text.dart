import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.text, this.textSize = 32});

  final String text;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // color: Colors.black87,
        fontSize: textSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
