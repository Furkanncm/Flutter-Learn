import 'package:flutter/material.dart';
import 'package:flutter_cubit/core/extensions/context_extensions.dart';

class RootTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool? isVisible;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator; // Düzenlendi

  const RootTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.isVisible,
    this.suffixIcon,
    this.onPressed,
    required this.inputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddigLow,
      child: TextFormField(
        validator: validator ??
            (value) {
              return null; // Varsayılan olarak hiçbir doğrulama yapılmaz
            },
        controller: controller,
        obscureText: isVisible ?? false,
        keyboardType: inputType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(suffixIcon),
                )
              : null,
        ),
      ),
    );
  }
}
