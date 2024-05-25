import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: BootstrapColors().primary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  '${product.stock.toString()} pcs',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  categoryIcons[product.category],
                  color: BootstrapColors().info,
                ),
                const SizedBox(width: 8),
                Text('Rp${product.price.toStringAsFixed(0)},-'),
                const Spacer(),
                Row(
                  children: [
                    const SizedBox(width: 4),
                    Text(product.formattedDate)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
