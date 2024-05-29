import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/empty.png'),
            width: 250,
          ),
          const SizedBox(height: 20),
          Text(text),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
