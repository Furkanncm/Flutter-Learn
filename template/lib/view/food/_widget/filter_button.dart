import 'package:flutter/material.dart';
import 'package:template/core/components/button/normal_icon_button.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onPressed;
  const FilterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return NormalIconButton(onPressed: onPressed, child: const Icon(Icons.filter_list_outlined));
  }
}
