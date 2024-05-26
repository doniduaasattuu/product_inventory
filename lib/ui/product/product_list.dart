import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/ui/product/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.products,
    required this.onAddProduct,
    required this.onRemoveProduct,
    required this.onUpdateProduct,
  });

  final Function(Product product) onAddProduct;
  final Function(Product product) onRemoveProduct;
  final Function(Product product, Map dataProductUpdated) onUpdateProduct;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(products[index].id),
        onDismissed: (direction) {
          onRemoveProduct(products[index]);
        },
        child: ProductItem(
          product: products[index],
          onAddProduct: onAddProduct,
          onRemoveProduct: onRemoveProduct,
          onUpdateProduct: onUpdateProduct,
        ),
      ),
    );
  }
}
