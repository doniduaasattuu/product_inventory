import 'package:flutter/material.dart';
import 'package:product_inventory/services/user_service.dart';
import 'package:product_inventory/ui/homepage/homepage.dart';
import 'package:product_inventory/ui/registration/registration.dart';
import 'package:product_inventory/utility/header_text.dart';
import 'package:product_inventory/utility/my_container.dart';
import 'package:product_inventory/widget/form_input.dart';
import 'package:product_inventory/widget/helper_text.dart';
import 'package:product_inventory/widget/modal.dart';
import 'package:product_inventory/widget/primary_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderText(text: 'Product Inventory'),
              const SizedBox(height: 20),
              Image.asset('assets/images/dark.png', width: 275),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  PrimaryButton(
                    buttonText: 'Login',
                    buttonOnPressed: () async {
                      // VALIDATION
                      if (_formKey.currentState!.validate()) {
                        String email = _email.text;
                        String password = _password.text;

                        await UserService().login(email, password).then(
                          (isVerified) {
                            if (isVerified) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Homepage(),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => Modal(
                                  modalMessage: 'Email or password is wrong.',
                                ),
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  // Text('Dont have an account ?, register here.'),
                  HelperText(
                    mainText: 'Don\'t have an account ?,',
                    linkText: 'register here.',
                    actionLink: const Registration(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
