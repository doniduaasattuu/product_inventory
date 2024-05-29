import 'package:flutter/material.dart';

class ListHorizCategory extends StatefulWidget {
  const ListHorizCategory({super.key});

  @override
  State<ListHorizCategory> createState() => _ListHorizCategoryState();
}

class _ListHorizCategoryState extends State<ListHorizCategory> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Container(
          //   width: 90,
          //   height: 20,
          //   color: Colors.red,
          // ),
          // Container(
          //   width: 90,
          //   height: 20,
          //   color: Colors.blue,
          // ),
          // Container(
          //   width: 90,
          //   height: 20,
          //   color: Colors.orange,
          // ),
          // Container(
          //   width: 90,
          //   height: 20,
          //   color: Colors.purple,
          // ),
          // Container(
          //   width: 90,
          //   height: 20,
          //   color: Colors.yellow,
          // ),
          Container(
            width: 90,
            height: 20,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
