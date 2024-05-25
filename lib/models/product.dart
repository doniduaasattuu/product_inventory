import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMMMd();

enum Category {
  gadget,
  computer,
  audio,
  smartwatch,
}

const categoryIcons = {
  Category.gadget: Icons.smartphone,
  Category.computer: Icons.computer,
  Category.audio: Icons.speaker,
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

  final String id;
  final String name;
  final int price;
  final Category category;
  final int stock;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}
