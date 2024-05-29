import 'package:flutter/material.dart';
import 'package:product_inventory/models/user.dart';
import 'package:product_inventory/services/user_service.dart';
import 'package:product_inventory/ui/user/user_list.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';
import 'package:product_inventory/utility/my_container.dart';
import 'package:product_inventory/utility/sidebar.dart';
import 'package:product_inventory/widget/floating_add_button.dart';

class Users extends StatefulWidget {
  const Users({super.key, required this.user});

  final User user;

  @override
  State<StatefulWidget> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<User> _registeredUser = UserService().index();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    void filterUser() {
      final String searchValue = _searchController.text;

      setState(() {
        _registeredUser = UserService().index(search: searchValue);
      });
    }

    Widget mainContent = const Center(
      child: Text('No users found.'),
    );

    if (_registeredUser.isNotEmpty) {
      mainContent = UserList(
        users: _registeredUser,
      );
    }

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: BootstrapColors().primary,
        title: const Text(
          'Product Inventory',
          textAlign: TextAlign.end,
        ),
      ),
      drawer: Sidebar(user: user),
      body: MyContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      filterUser();
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Users',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingAddButton(
        onPressed: () {},
      ),
    );
  }
}
