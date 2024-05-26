import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';
import 'package:product_inventory/widget/suffix_clear_button.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({super.key, required this.onAddProduct});

  final Function(Product product) onAddProduct;

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  Category _selectedCategory = Category.values.first;
  DateTime? _selectedDate = DateTime.now();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month - 1, now.day);
    final lastDate = now;

    final dateSelected = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      _selectedDate = dateSelected;
    });
  }

  void _submitProductData() {
    final enteredPrice = int.tryParse(_priceController.text);
    final isPriceInvalid = enteredPrice == null || enteredPrice <= 0;
    final enteredStock = int.tryParse(_stockController.text) ?? 0;

    if (_nameController.text.isEmpty ||
        _priceController.text.contains('.') ||
        _stockController.text.contains('.') ||
        isPriceInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Input is invalid.'),
          content: const Text(
              'Please make sure a valid name, price, stock, category and date'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    final name = _nameController.text;
    final price = enteredPrice;
    final category = _selectedCategory;
    final stock = enteredStock;
    final date = _selectedDate!;

    widget.onAddProduct(
      Product(
          name: name,
          price: price,
          category: category,
          stock: stock,
          date: date),
    );
    Navigator.pop(context);

    // print(_nameController.text);
    // print(_priceController.text);
    // print(enteredStock);
    // print(_selectedCategory);
    // print(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'New Product',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            maxLength: 50,
            controller: _nameController,
            decoration: InputDecoration(
              label: const Text('Product name'),
              suffixIcon: SuffixClearButton(onPressed: _nameController),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  decoration: InputDecoration(
                    prefixText: 'Rp',
                    label: const Text('Price'),
                    suffixIcon: SuffixClearButton(onPressed: _priceController),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _stockController,
                  decoration: InputDecoration(
                    prefixText: 'Qty ',
                    label: const Text('Stock'),
                    suffixIcon: SuffixClearButton(onPressed: _stockController),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toString().toUpperCase()),
                        ))
                    .toList(),
                // value: Category.values.first,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Text(_selectedDate == null
                      ? 'No date selected.'
                      : formatter.format(_selectedDate!).toString()),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _submitProductData,
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(BootstrapColors().primary),
                ),
                child: Text(
                  'Save product',
                  style: TextStyle(color: BootstrapColors().light),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
