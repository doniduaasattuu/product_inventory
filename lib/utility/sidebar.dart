import 'package:flutter/material.dart';
import 'package:product_inventory/models/user.dart';
import 'package:product_inventory/ui/auth/login.dart';
import 'package:product_inventory/ui/product/products.dart';
import 'package:product_inventory/ui/sales/sales.dart';
import 'package:product_inventory/ui/user/users.dart';
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
            leading: const Icon(Icons.home_rounded),
            title: const Text('Products'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Products(user: user),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.category_outlined),
          //   title: const Text('Category'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => Products(user: user),
          //       ),
          //     );
          //   },
          // ),
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
                  builder: (context) => Sales(user: user),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Users'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Users(user: user),
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
