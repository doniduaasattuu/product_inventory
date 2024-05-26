import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/ui/product/form_product.dart';
import 'package:product_inventory/ui/product/product_list.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';
import 'package:product_inventory/utility/my_container.dart';
import 'package:product_inventory/widget/floating_add_button.dart';
import 'package:product_inventory/utility/sidebar.dart';

final DateTime now = DateTime.now();

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<StatefulWidget> createState() => _ProductState();
}

class _ProductState extends State<Products> {
  final List<Product> _registeredProduct = [
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

  void _addProduct(Product product) {
    setState(
      () {
        _registeredProduct.add(product);
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: BootstrapColors().dark,
        content: Text(
          'Product added successfully.',
          style: TextStyle(
            color: BootstrapColors().light,
          ),
        ),
        action: SnackBarAction(
          textColor: BootstrapColors().primary,
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
        ),
      ),
    );
  }

  void _removeProduct(Product product) {
    final indexProduct = _registeredProduct.indexOf(product);

    setState(() {
      _registeredProduct.remove(product);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: BootstrapColors().dark,
        content: Text(
          'Product deleted.',
          style: TextStyle(
            color: BootstrapColors().light,
          ),
        ),
        action: SnackBarAction(
          textColor: BootstrapColors().primary,
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _registeredProduct.insert(indexProduct, product);
            });
          },
        ),
      ),
    );
  }

  void _updateProduct(Product product, Map dataProductUpdated) {
    int indexProduct = _registeredProduct.indexOf(product);
    Product currentProduct = _registeredProduct[indexProduct];

    setState(
      () {
        currentProduct.name = dataProductUpdated['name'];
        currentProduct.price = dataProductUpdated['price'];
        currentProduct.category = dataProductUpdated['category'];
        currentProduct.stock = dataProductUpdated['stock'];
        currentProduct.date = dataProductUpdated['date'];
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: BootstrapColors().dark,
        content: Text(
          'Product updated successfully.',
          style: TextStyle(
            color: BootstrapColors().light,
          ),
        ),
        action: SnackBarAction(
          textColor: BootstrapColors().primary,
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
        ),
      ),
    );
  }

  void _openAddProductOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return FormProduct(
            onAddProduct: _addProduct,
            onRemoveProduct: _removeProduct,
            onUpdateProduct: _updateProduct,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    Widget mainContent = const Center(
      child: Text('No products found.'),
    );

    if (_registeredProduct.isNotEmpty) {
      mainContent = ProductList(
        products: _registeredProduct,
        onRemoveProduct: _removeProduct,
        onAddProduct: _addProduct,
        onUpdateProduct: _updateProduct,
      );
    }

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: BootstrapColors().primary,
        title: const Text(
          'Product Inventory',
          textAlign: TextAlign.end,
        ),
      ),
      drawer: const Sidebar(),
      body: MyContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingAddButton(
        onPressed: _openAddProductOverlay,
      ),
    );
  }
}
