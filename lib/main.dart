import 'package:flutter/material.dart';
import 'package:product_inventory/ui/auth/login.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: BootstrapColors().primary);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Inventory App',
      home: const Login(),
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        cardTheme: const CardTheme().copyWith(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: BootstrapColors().tertiary),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        ),
      ),
    );
  }
}
