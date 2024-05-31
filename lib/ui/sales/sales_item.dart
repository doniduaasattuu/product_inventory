import 'package:flutter/material.dart';
import 'package:product_inventory/models/sales_model.dart';

class SalesItem extends StatelessWidget {
  const SalesItem({super.key, required this.sales});

  final SalesModel sales;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sales.month,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(sales.admin),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${sales.sales.toString()} Jt'),
            Text(sales.formattedDate.toString()),
          ],
        )
      ],
    );
  }
}
