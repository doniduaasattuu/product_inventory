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
    // final List<Category> categories =
    //     Category.values.map((category) => category).toList();

    List<DropdownMenuEntry> init = [
      const DropdownMenuEntry(value: null, label: '')
    ];

    List<DropdownMenuEntry> cate = Category.values
        .map((category) => DropdownMenuEntry(
            value: category, label: category.name.toUpperCase()))
        .toList();

    final List<DropdownMenuEntry> categories = init + cate;

    // categories.insert(0, '');

    return DropdownMenu(
      controller: widget.controller,
      // dropdownMenuEntries: categories
      //     .map(
      //       (category) => DropdownMenuEntry(
      //         value: category,
      //         label: category.toUpperCase(),
      //       ),
      //     )
      //     .toList(),

      // dropdownMenuEntries: Category.values
      //     .map((category) => DropdownMenuEntry(
      //           value: category.index,
      //           label: category.index.toString(),
      //         ))
      //     .toList(),

      dropdownMenuEntries: categories.map((e) => e).toList(),
      onSelected: (category) {
        widget.onSelected(category);
      },
    );
  }
}
