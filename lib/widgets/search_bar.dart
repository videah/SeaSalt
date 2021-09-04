import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;

  const SearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: () {
        print("text");
      },
      decoration: InputDecoration(
        filled: true,
        hintText: "Search...",
        border: UnderlineInputBorder(),
      ),
    );
  }
}
