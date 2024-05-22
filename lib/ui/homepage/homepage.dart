import 'package:flutter/material.dart';
import 'package:product_inventory/models/bootstrap_colors.dart';
import 'package:product_inventory/utility/header_text.dart';
import 'package:product_inventory/utility/my_container.dart';
// import 'package:product_inventory/widget/form_input.dart';
// import 'package:product_inventory/widget/form_select.dart';
import 'package:product_inventory/widget/primary_button.dart';
import 'package:product_inventory/widget/sidebar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Inventory'),
      ),
      drawer: const Sidebar(),
      body: MyContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PrimaryButton(
                  buttonText: 'New product',
                  buttonIcon: Icon(
                    Icons.add_box_rounded,
                    color: BootstrapColors().light,
                  ),
                  buttonOnPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      onChanged: (value) => {
                        if (value != 'hello')
                          {
                            'Value is not hello',
                          },
                      },
                      decoration: const InputDecoration(
                        hintText: 'Filter',
                        suffix: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const HeaderText(
              text: 'Product data',
              textSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
