import 'package:flutter/material.dart';
import 'package:product_inventory/models/user.dart';
import 'package:product_inventory/ui/auth/login.dart';
import 'package:product_inventory/widget/account_drawer.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AccountDrawer(
            user: user,
          ),
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text('Scanner'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Purchase'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.trending_up_outlined),
            title: const Text('Sales'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('User'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
