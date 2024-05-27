import 'package:flutter/material.dart';
import 'package:product_inventory/services/user_service.dart';
import 'package:product_inventory/ui/auth/login.dart';
import 'package:product_inventory/utility/header_text.dart';
import 'package:product_inventory/utility/my_container.dart';
import 'package:product_inventory/widget/alert.dart';
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
  final _passwordConfirm = TextEditingController();
  final _phoneNumber = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _passwordConfirm.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

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
                      keyboardType: TextInputType.emailAddress,
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
                      inputLabel: 'Password confirm',
                      secure: true,
                      inputController: _passwordConfirm,
                      inputValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password confirmation is required.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    FormInput(
                      keyboardType: TextInputType.number,
                      inputLabel: 'Phone number',
                      inputController: _phoneNumber,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        PrimaryButton(
                          buttonText: 'Sign In',
                          buttonOnPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String name = _name.text;
                              String email = _email.text;
                              String password = _password.text;
                              String passwordConfirm = _passwordConfirm.text;
                              String phoneNumber = _phoneNumber.text;

                              await UserService()
                                  .register(email, name, password,
                                      passwordConfirm, phoneNumber)
                                  .then(
                                (registrationResponse) {
                                  if (registrationResponse == 200) {
                                    // 200 == registration success
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return Alert(
                                          ctx: ctx,
                                          title: 'Registration success.',
                                          content:
                                              'Your account successfully created.',
                                          onPressed: const Login(),
                                        );
                                      },
                                    );
                                  } else if (registrationResponse == 409) {
                                    // 409 == registration error duplicate
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return Alert(
                                          ctx: ctx,
                                          title: 'Registration failed.',
                                          content:
                                              'The email address and/or account name provided may be registered already.',
                                        );
                                      },
                                    );
                                  } else if (registrationResponse == 422) {
                                    // 422 == password do not match
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return Alert(
                                          ctx: ctx,
                                          title: 'Registration failed.',
                                          content:
                                              'Password do not match, enter your password and confirmation again.',
                                        );
                                      },
                                    );
                                  } else {
                                    // 400 == client error registration
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return Alert(
                                          ctx: ctx,
                                          title: 'Registration failed.',
                                          content:
                                              'Please make sure a valid email, name, password and phone number.',
                                        );
                                      },
                                    );
                                  }
                                },
                              );
                            }
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        HelperText(
                          mainText: 'Already have an account ?,',
                          linkText: 'Login here.',
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
