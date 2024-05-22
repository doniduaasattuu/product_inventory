import 'package:flutter/material.dart';
import 'package:product_inventory/ui/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Inventory',
      home: const Login(),
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: BootstrapColors().info),
      // ),
    );
  }
}
