import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/ui/product/product_item.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

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
        background: Expanded(
          child: Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: BootstrapColors().danger,
            ),
            child: const Row(
              children: [
                Icon(Icons.delete, size: 30),
                Spacer(),
                Icon(Icons.delete, size: 30),
              ],
            ),
          ),
        ),
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
