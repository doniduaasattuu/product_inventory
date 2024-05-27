import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/utility/utility.dart';

List<Product> products = [
  Product(
    name: 'iPhone 13 Pro Max',
    price: 13000000,
    category: Category.gadget,
    stock: 12,
    date: DateTime(now.year, now.month, now.day - 7),
  ),
  Product(
    name: 'iPhone 12 Pro',
    price: 11000000,
    category: Category.gadget,
    stock: 18,
    date: DateTime(now.year, now.month, now.day - 6),
  ),
  Product(
    name: 'iPhone 13',
    price: 12500000,
    category: Category.gadget,
    stock: 8,
    date: DateTime(now.year, now.month, now.day - 5),
  ),
  Product(
    name: 'Macbook Pro 2024',
    price: 32500000,
    category: Category.computer,
    stock: 5,
    date: DateTime(now.year, now.month, now.day - 4),
  ),
  Product(
    name: 'Apple watch 2024',
    price: 8500000,
    category: Category.smartwatch,
    stock: 35,
    date: DateTime(now.year, now.month, now.day - 3),
  ),
  Product(
    name: 'Senheiser Momentum 4',
    price: 4950000,
    category: Category.audio,
    stock: 103,
    date: DateTime(now.year, now.month, now.day - 2),
  ),
  // Product(
  //   name: 'MacBook Air 2024',
  //   price: 32000000,
  //   category: Category.computer,
  //   stock: 7,
  //   date: DateTime(now.year, now.month, now.day - 1),
  // ),
  // Product(
  //   name: 'Sony Monitor Speaker',
  //   price: 19000000,
  //   category: Category.audio,
  //   stock: 2,
  //   date: now,
  // ),
];
