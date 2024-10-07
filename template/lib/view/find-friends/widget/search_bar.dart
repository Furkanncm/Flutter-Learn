import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        prefixIconColor: Theme.of(context).iconTheme.color,
        iconColor: Theme.of(context).iconTheme.color,
        labelStyle: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
