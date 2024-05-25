import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';

// final List<DropdownMenuItem> categoryList = Category.values
//     .map((category) => DropdownMenuItem(
//         value: category, child: Text(category.name.toString().toUpperCase())))
//     .toList();

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  Category _selectedCategory = Category.values.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              label: const Text('Product name'),
              suffixIcon: IconButton(
                onPressed: () {
                  _nameController.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  decoration: InputDecoration(
                    prefixText: 'Rp',
                    label: const Text('Price'),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _nameController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButton(
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toString().toUpperCase()),
                          ))
                      .toList(),
                  value: Category.values.first,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }

                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
