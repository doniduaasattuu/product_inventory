import 'package:product_inventory/utility/utility.dart';

class User {
  User({
    required this.email,
    required this.name,
    required this.password,
    required this.phoneNumber,
  }) : id = uuid.v4();

  final String id;
  final String email;
  final String name;
  final String password;
  final String phoneNumber;
}
