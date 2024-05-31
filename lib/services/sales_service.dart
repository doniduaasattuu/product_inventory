import 'package:product_inventory/data/sales.dart';
import 'package:product_inventory/models/sales_model.dart';

import '../ui/sales/sales.dart';

class SalesService {
  List<SalesModel> index() {
    List<SalesModel> salesData = [];

    for (var i = 0; i < sales.length; i++) {
      salesData.add(sales[i]);
    }

    return salesData;
  }

  List<SalesData> salesData() {
    List<SalesData> salesData = [];

    for (var i = 0; i < sales.length; i++) {
      salesData.add(SalesData(sales[i].month, sales[i].sales));
    }

    return salesData;
  }
}
