import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/ui/product/new_product.dart';
import 'package:product_inventory/ui/product/product_list.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<StatefulWidget> createState() => _ProductState();
}

class _ProductState extends State<Products> {
  final List<Product> _registeredProduct = [
    Product(
      name: 'iPhone 13 Pro Max',
      price: 13000000,
      category: Category.gadget,
      stock: 12,
      date: DateTime.now(),
    ),
    Product(
      name: 'iPhone 12 Pro',
      price: 11000000,
      category: Category.gadget,
      stock: 18,
      date: DateTime.now(),
    ),
    Product(
      name: 'iPhone 13',
      price: 12500000,
      category: Category.gadget,
      stock: 8,
      date: DateTime.now(),
    ),
    Product(
      name: 'Macbook Pro 2024',
      price: 32500000,
      category: Category.computer,
      stock: 5,
      date: DateTime.now(),
    ),
    Product(
      name: 'Apple watch 2024',
      price: 8500000,
      category: Category.smartwatch,
      stock: 35,
      date: DateTime.now(),
    ),
    Product(
      name: 'Senheiser Momentum 4',
      price: 4950000,
      category: Category.audio,
      stock: 103,
      date: DateTime.now(),
    ),
  ];

  void _openAaddProductOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const NewProduct();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Inventory'),
        actions: [
          IconButton(
            onPressed: _openAaddProductOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'List of products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ProductList(
                products: _registeredProduct,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
