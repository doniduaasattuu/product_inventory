import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';
import 'package:product_inventory/widget/alert.dart';
import 'package:product_inventory/widget/suffix_clear_button.dart';

class FormProduct extends StatefulWidget {
  const FormProduct({
    super.key,
    required this.onAddProduct,
    required this.onRemoveProduct,
    required this.onUpdateProduct,
    this.product,
  });

  final Function(Product product) onAddProduct;
  final Function(Product product) onRemoveProduct;
  final Function(Product product, Map dataProductUpdated) onUpdateProduct;
  final Product? product;

  @override
  State<FormProduct> createState() => _FormProductState();
}

class _FormProductState extends State<FormProduct> {
  String? currentProductName;
  String? currentProductPrice;
  String? currentProductStock;
  Category? currentProductCategory;
  Product? product;
  List<Product>? products;

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
    final enteredStock = int.tryParse(_stockController.text) ?? 0;
    final isPriceInvalid = enteredPrice == null || enteredPrice <= 0;

    if (_nameController.text.isEmpty ||
        _priceController.text.contains('.') ||
        _stockController.text.contains('.') ||
        isPriceInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return Alert(
            ctx: ctx,
            title: 'Input is invalid.',
            content:
                'Please make sure a valid name, price, stock, category and date',
          );
        },
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
        date: date,
      ),
    );
    Navigator.pop(context);
  }

  void _updateProductData(Product product) {
    final enteredPrice = int.tryParse(_priceController.text);
    final enteredStock = int.tryParse(_stockController.text) ?? 0;
    final isPriceInvalid = enteredPrice == null || enteredPrice <= 0;

    if (_nameController.text.isEmpty ||
        _priceController.text.contains('.') ||
        _stockController.text.contains('.') ||
        isPriceInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return Alert(
            ctx: ctx,
            title: 'Input is invalid.',
            content:
                'Please make sure a valid name, price, stock, category and date',
          );
        },
      );
      return;
    }

    final name = _nameController.text;
    final price = enteredPrice;
    final category = _selectedCategory;
    final stock = enteredStock;
    final date = _selectedDate!;

    Map dataProductUpdated = {
      'name': name,
      'price': price,
      'category': category,
      'stock': stock,
      'date': date,
    };

    widget.onUpdateProduct(product, dataProductUpdated);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var product = widget.product;

    if (product != null) {
      _nameController.text = currentProductName ?? product.name;
      _priceController.text = currentProductPrice ?? product.price.toString();
      _stockController.text = currentProductStock ?? product.stock.toString();
      _selectedCategory = currentProductCategory ?? product.category;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            product == null ? 'New Product' : 'Update product',
            style: const TextStyle(
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
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }

              if (product != null) {
                currentProductName = value;
                setState(
                  () {
                    _nameController.text = currentProductName!;
                  },
                );
              } else {
                setState(() {
                  _nameController.text = value;
                });
              }
            },
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
                  onChanged: (value) {
                    if (value.isEmpty) {
                      return;
                    }

                    if (product != null) {
                      currentProductPrice = value;
                      setState(
                        () {
                          _priceController.text = currentProductPrice!;
                        },
                      );
                    } else {
                      setState(() {
                        _priceController.text = value;
                      });
                    }
                  },
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
                  onChanged: (value) {
                    if (value.isEmpty) {
                      return;
                    }

                    if (product != null) {
                      currentProductStock = value;
                      setState(() {
                        _stockController.text = currentProductStock!;
                      });
                    } else {
                      setState(() {
                        _stockController.text = value;
                      });
                    }
                  },
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
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  if (product != null) {
                    currentProductCategory = value;
                    setState(() {
                      _selectedCategory = currentProductCategory!;
                    });
                  } else {
                    setState(() {
                      _selectedCategory = value;
                    });
                  }
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
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (product == null)
                    ? _submitProductData
                    : () {
                        _updateProductData(product);
                      },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(BootstrapColors().primary),
                ),
                child: Text(
                  product == null ? 'Save' : 'Update',
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
