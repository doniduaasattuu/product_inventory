import 'package:product_inventory/utility/utility.dart';

class SalesModel {
  SalesModel({
    required this.month,
    required this.sales,
    required this.admin,
    required this.date,
  });

  final String month;
  final double sales;
  final String admin;
  final DateTime date;

  get formattedDate {
    return formatter.format(date);
  }
}
