import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/ui/product/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) => ProductItem(product: products[index]),
    );
  }
}
