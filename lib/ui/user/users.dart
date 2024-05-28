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
  final List<User> _registeredUser = UserService().index();

  @override
  Widget build(BuildContext context) {
    final user = widget.user;

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
                    // controller: _searchController,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      // suffixIcon: IconButton(
                      //   onPressed: _filterProduct,
                      //   icon: const Icon(Icons.search),
                      // ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: DropdownButton(
                //     items: Category.values
                //         .map((category) => DropdownMenuItem(
                //               value: category,
                //               child:
                //                   Text(category.name.toString().toUpperCase()),
                //             ))
                //         .toList(),
                //     onChanged: (value) {},
                //   ),
                // ),
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
