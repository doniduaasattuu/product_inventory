import 'package:flutter/material.dart';
import 'package:product_inventory/models/user.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

class AccountDrawer extends StatelessWidget {
  const AccountDrawer({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            BootstrapColors().primary,
            BootstrapColors().dark,
          ],
        ),
      ),
      accountName: Text(
        user.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      accountEmail: Text(
        user.email,
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage("assets/images/${user.email}.jpg"),
      ),
    );
  }
}


// class AccountDrawer extends StatefulWidget {
//   const AccountDrawer({super.key, required this.user});

//   final User user;

//   @override
//   State<AccountDrawer> createState() => _AccountDrawerState();
// }

// class _AccountDrawerState extends State<AccountDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     final User user = widget.user;

//     return UserAccountsDrawerHeader(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             BootstrapColors().primary,
//             BootstrapColors().dark,
//           ],
//         ),
//       ),
//       accountName: Text(
//         user.name,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       accountEmail: Text(
//         user.email,
//       ),
//       currentAccountPicture: CircleAvatar(
//         backgroundImage: AssetImage("assets/images/${user.email}.jpg"),
//       ),
//     );
//   }
// }
