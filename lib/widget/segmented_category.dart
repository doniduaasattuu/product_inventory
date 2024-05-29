import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';

class SegmentedCategory extends StatefulWidget {
  const SegmentedCategory({super.key});

  @override
  State<SegmentedCategory> createState() => _SegmentedCategoryState();
}

class _SegmentedCategoryState extends State<SegmentedCategory> {
  Category categorySelected = Category.audio;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SegmentedButton<Category>(
          segments: <ButtonSegment<Category>>[
            ButtonSegment(
              value: Category.gadget,
              // label: const Text('Gadget'),
              icon: Icon(categoryIcons[Category.gadget]),
            ),
            ButtonSegment(
              value: Category.audio,
              // label: const Text('Audio'),
              icon: Icon(categoryIcons[Category.audio]),
            ),
            ButtonSegment(
              value: Category.computer,
              // label: const Text('Computer'),
              icon: Icon(categoryIcons[Category.computer]),
            ),
            ButtonSegment(
              value: Category.smartwatch,
              // label: const Text('Smartwatch'),
              icon: Icon(categoryIcons[Category.smartwatch]),
            ),
          ],
          selected: <Category>{categorySelected},
          onSelectionChanged: (Set<Category> newSelection) {
            setState(() {
              categorySelected = newSelection.first;
            });
          },
        ),
      ],
    );
  }
}
