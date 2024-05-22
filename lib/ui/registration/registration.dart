import 'package:flutter/material.dart';
import 'package:product_inventory/ui/login/login.dart';
import 'package:product_inventory/utility/header_text.dart';
import 'package:product_inventory/utility/my_container.dart';
import 'package:product_inventory/widget/form_input.dart';
import 'package:product_inventory/widget/helper_text.dart';
import 'package:product_inventory/widget/primary_button.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  HeaderText(
                    text: 'Registration',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormInput(
                      inputLabel: 'Name',
                      inputController: _name,
                      inputValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    FormInput(
                      inputLabel: 'Email',
                      inputController: _email,
                      inputValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required.';
                        } else if (value.isNotEmpty && !value.contains('@')) {
                          return 'Enter a valid email address.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    FormInput(
                      inputLabel: 'Password',
                      secure: true,
                      inputController: _password,
                      inputValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    FormInput(
                      inputLabel: 'Phone number',
                      secure: true,
                      inputController: _phoneNumber,
                      inputValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        PrimaryButton(
                          buttonText: 'Register',
                          buttonOnPressed: () {},
                        )
                      ],
                    ),
                    Row(
                      children: [
                        // Text('Dont have an account ?, register here.'),
                        HelperText(
                          mainText: 'Already have an account ?,',
                          linkText: 'login here.',
                          actionLink: const Login(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
