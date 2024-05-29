import 'package:flutter/material.dart';
import 'package:product_inventory/models/user.dart';
import 'package:product_inventory/ui/user/pop_up_menu.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';
import 'package:product_inventory/utility/header_text.dart';

enum Menu { preview, share, getLink, remove, download }

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: BootstrapColors().dark,
                          size: 28,
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              BootstrapColors().secondary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderText(
                        text: user.name,
                        textSize: 16,
                      ),
                      Text(
                        user.email,
                        style: TextStyle(
                          color: BootstrapColors().secondary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Column(
                    children: [
                      PopUpMenu(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
