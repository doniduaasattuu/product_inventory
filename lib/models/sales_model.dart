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

  static String formattedMonth(String month) {
    if (month == 'Jan') {
      return 'January';
    } else if (month == 'Feb') {
      return 'February';
    } else if (month == 'Mar') {
      return 'March';
    } else if (month == 'Apr') {
      return 'April';
    } else if (month == 'May') {
      return 'May';
    } else if (month == 'Jun') {
      return 'Juni';
    } else if (month == 'Jul') {
      return 'July';
    } else if (month == 'Aug') {
      return 'August';
    } else if (month == 'Sep') {
      return 'September';
    } else if (month == 'Oct') {
      return 'October';
    } else if (month == 'Nov') {
      return 'November';
    } else if (month == 'Dec') {
      return 'December';
    } else {
      return month;
    }
  }
}
