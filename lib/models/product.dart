import 'package:flutter/material.dart';
import 'package:product_inventory/utility/utility.dart';

enum Category {
  gadget,
  computer,
  audio,
  smartwatch,
}

const categoryIcons = {
  Category.gadget: Icons.smartphone,
  Category.computer: Icons.computer,
  Category.audio: Icons.headphones,
  Category.smartwatch: Icons.watch,
};

class Product {
  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.stock,
    required this.date,
  }) : id = uuid.v4();

  String id;
  String name;
  int price;
  Category category;
  int stock;
  DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }

  void setName(String name) {
    this.name = name;
  }

  void setPrice(int price) {
    this.price = price;
  }

  void setCategory(Category category) {
    this.category = category;
  }

  void setStock(int stock) {
    this.stock = stock;
  }

  void setDate(DateTime date) {
    this.date = date;
  }
}
