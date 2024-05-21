import 'package:flutter/material.dart';
import 'package:product_inventory/models/bootstrap_colors.dart';
import 'package:product_inventory/services/user_service.dart';
import 'package:product_inventory/ui/homepage/homepage.dart';
import 'package:product_inventory/utility/header_text.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HeaderText(text: 'Product Inventory'),
                // const SizedBox(height: 20),
                Image.asset('assets/images/header_image.png', width: 350),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: false,
                        controller: _email,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required.';
                          } else if (value != null && !value.contains('@')) {
                            return 'Enter a valid email address.';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        controller: _password,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
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
                                  builder: (context) => AlertDialog(
                                    content: const Text(
                                      'Email or password is wrong.',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                            BootstrapColors().primary,
                                          ),
                                          padding: WidgetStateProperty.all(
                                            const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 8,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Close',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          );
                        }
                      },
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
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text('Dont have an account ?, register here.'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
