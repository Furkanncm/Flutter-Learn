import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class BaseTextFormfield extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String text;
  final bool isVisible;
  final IconData prefixIcon;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  const BaseTextFormfield({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.text,
    this.isVisible = false,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isVisible,
        validator: validator,
        style: Theme.of(context).textTheme.labelSmall,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            prefixIconColor: Theme.of(context).iconTheme.color,
            iconColor: Theme.of(context).iconTheme.color,
            labelStyle: Theme.of(context).textTheme.displaySmall,
            labelText: text,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon ?? const SizedBox.shrink()),
      ),
    );
  }
}
