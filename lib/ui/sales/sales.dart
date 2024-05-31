import 'package:flutter/material.dart';
import 'package:product_inventory/models/user.dart';
import 'package:product_inventory/services/sales_service.dart';
import 'package:product_inventory/ui/sales/sales_recent.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';
import 'package:product_inventory/utility/header_text.dart';
import 'package:product_inventory/utility/my_container.dart';
import 'package:product_inventory/utility/sidebar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Sales extends StatefulWidget {
  const Sales({super.key, required this.user});

  final User user;

  @override
  State<StatefulWidget> createState() => _SalesState();
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    final User user = widget.user;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: BootstrapColors().primary,
        title: const Text(
          'Product Inventory',
          textAlign: TextAlign.end,
        ),
      ),
      drawer: Sidebar(user: user),
      body: MyContainer(
        child: SizedBox(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BootstrapColors().primary,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 18),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: BootstrapColors().light,
                      ),
                      Text(
                        'New Sales',
                        style: TextStyle(
                          color: BootstrapColors().light,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 250,
              child: SfCartesianChart(
                // Initialize category axis
                margin: EdgeInsets.zero,
                primaryXAxis: const CategoryAxis(),
                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                    // Bind data source
                    dataSource: SalesService().salesData(),
                    // <SalesData>[
                    //   SalesData('Jun', 32),
                    //   SalesData('Jul', 42),
                    //   SalesData('Aug', 34),
                    //   SalesData('Sep', 56),
                    //   SalesData('Oct', 48),
                    //   SalesData('Nov', 23),
                    //   SalesData('Dec', 17),
                    //   SalesData('Jan', 26),
                    //   SalesData('Feb', 43),
                    //   SalesData('Mar', 34),
                    //   SalesData('Apr', 52),
                    //   SalesData('May', 68),
                    // ]
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    color: BootstrapColors().lighgreen,
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderText(text: 'Recent sales', textSize: 22),
                Spacer(),
                DropdownMenu(
                  inputDecorationTheme: InputDecorationTheme(
                    border: InputBorder.none,
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'Daily', label: 'Daily'),
                    DropdownMenuEntry(value: 'Monthly', label: 'Monthly'),
                    DropdownMenuEntry(value: 'Year', label: 'Year'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Expanded(
              child: SalesRecent(),
            ),
          ],
        )),
      ),
    );
  }
}
