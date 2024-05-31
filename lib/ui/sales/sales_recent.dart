import 'package:flutter/material.dart';
import 'package:product_inventory/models/sales_model.dart';
import 'package:product_inventory/services/sales_service.dart';
import 'package:product_inventory/ui/sales/sales_item.dart';

class SalesRecent extends StatefulWidget {
  const SalesRecent({super.key});

  @override
  State<StatefulWidget> createState() => _SalesRecentState();
}

class _SalesRecentState extends State<SalesRecent> {
  @override
  Widget build(BuildContext context) {
    List<SalesModel> data = SalesService().index().reversed.toList();

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (ctx, index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SalesItem(
            sales: data[index],
          ),
        ),
      ),
    );
  }
}
