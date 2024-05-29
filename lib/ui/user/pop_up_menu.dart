import 'package:flutter/material.dart';

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
      icon: const Icon(Icons.more_vert),
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
