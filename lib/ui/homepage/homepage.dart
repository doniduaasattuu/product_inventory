import 'package:flutter/material.dart';
import 'package:product_inventory/widget/sidebar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text('Product Inventory'),
      ),
      drawer: const Sidebar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: const Center(
          child: Text('Homepage'),
        ),
      ),
    );
  }
}
