import 'package:flutter/material.dart';
import 'package:product_inventory/ui/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Product Inventory',
      home: Homepage(),
    );
  }
}
