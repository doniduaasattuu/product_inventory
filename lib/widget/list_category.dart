import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({super.key, this.controller, required this.onSelected});

  final TextEditingController? controller;
  final Function(Category? category) onSelected;

  @override
  State<StatefulWidget> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry> init = [
      const DropdownMenuEntry(value: null, label: '-- ALL --')
    ];

    List<DropdownMenuEntry> cate = Category.values
        .map((category) => DropdownMenuEntry(
            value: category, label: category.name.toUpperCase()))
        .toList();

    final List<DropdownMenuEntry> categories = init + cate;

    return DropdownMenu(
      label: const Text('Category'),
      controller: widget.controller,
      dropdownMenuEntries: categories.map((e) => e).toList(),
      onSelected: (category) {
        widget.onSelected(category);
      },
    );
  }
}
