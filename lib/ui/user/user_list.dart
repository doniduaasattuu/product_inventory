import 'package:flutter/material.dart';
import 'package:product_inventory/models/user.dart';
import 'package:product_inventory/ui/user/user_item.dart';

class UserList extends StatelessWidget {
  const UserList({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (ctx, index) {
        return UserItem(user: users[index]);
      },
    );
  }
}
