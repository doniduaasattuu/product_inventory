import 'package:flutter/material.dart';
import 'package:product_inventory/models/bootstrap_colors.dart';
import 'package:product_inventory/utility/input/input_text.dart';
import 'package:product_inventory/utility/header_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderText(text: 'Product Inventory'),
              // const SizedBox(height: 20),
              Image.asset('assets/images/header_image.png', width: 350),
              const SizedBox(height: 20),
              const InputText(
                label: 'Email',
              ),
              const SizedBox(height: 20),
              const InputText(
                label: 'Password',
                secure: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        BootstrapColors().primary,
                      ),
                    ),
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
