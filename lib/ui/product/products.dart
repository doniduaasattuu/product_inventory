import 'package:flutter/material.dart';
import 'package:product_inventory/models/product.dart';
import 'package:product_inventory/models/user.dart';
import 'package:product_inventory/services/product_service.dart';
import 'package:product_inventory/ui/product/form_product.dart';
import 'package:product_inventory/ui/product/product_list.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';
import 'package:product_inventory/utility/my_container.dart';
import 'package:product_inventory/widget/floating_add_button.dart';
import 'package:product_inventory/utility/sidebar.dart';
import 'package:product_inventory/widget/list_category.dart';

class Products extends StatefulWidget {
  const Products({super.key, required this.user});

  final User user;

  @override
  State<StatefulWidget> createState() => _ProductState();
}

class _ProductState extends State<Products> {
  List<Product> _registeredProduct = ProductService().index();
  final _searchController = TextEditingController();
  Category? _selectedCategory;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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

  void _filterProduct() {
    final String searchValue = _searchController.text;

    _restartProduct();

    setState(
      () {
        _registeredProduct = ProductService()
            .index(search: searchValue, category: _selectedCategory);
      },
    );
  }

  void _restartProduct() {
    setState(() {
      _registeredProduct = ProductService().index();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;

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
      drawer: Sidebar(user: user),
      body: MyContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      _filterProduct();
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      // suffixIcon: IconButton(
                      //   onPressed: _filterProduct,
                      //   icon: const Icon(Icons.search),
                      // ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ListCategory(
                  onSelected: (category) {
                    _selectedCategory = category;
                    _filterProduct();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // ListCategory(),
            const SizedBox(height: 8),
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
