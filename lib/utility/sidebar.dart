import 'package:flutter/material.dart';
import 'package:product_inventory/data/users.dart';
import 'package:product_inventory/ui/auth/login.dart';
import 'package:product_inventory/widget/account_drawer.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // UserAccountsDrawerHeader(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //       colors: [
          //         BootstrapColors().primary,
          //         BootstrapColors().dark,
          //       ],
          //     ),
          //   ),
          //   accountName: const Text(
          //     'Doni Darmawan',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   accountEmail: const Text(
          //     'admin@product_inventory.com',
          //   ),
          //   currentAccountPicture: const CircleAvatar(
          //     backgroundImage: AssetImage("assets/images/doni.jpg"),
          //   ),
          // ),
          AccountDrawer(
            user: users[0],
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
