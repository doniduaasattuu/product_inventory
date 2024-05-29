import 'package:flutter/material.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';

enum Menu { preview, share, getLink, remove, download }

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert,
        color: BootstrapColors().secondary,
      ),
      itemBuilder: (ctx) => <PopupMenuEntry<Menu>>[
        const PopupMenuItem(
          value: Menu.preview,
          child: ListTile(
            leading: Icon(Icons.visibility_outlined),
            title: Text('Preview'),
          ),
        ),
      ],
    );
  }
}
