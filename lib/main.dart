import 'package:flutter/material.dart';
import 'package:product_inventory/ui/product/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Inventory',
      home: const Products(),
      theme: ThemeData.dark(),
    );
  }
}
