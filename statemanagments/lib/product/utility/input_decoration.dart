import 'package:flutter/material.dart';

class ProjectInput extends InputDecoration {
  ProjectInput(
    final String text,
    final Icon prefixIcon,
    final IconButton? suffixIcon,
  ) : super(
          border: const OutlineInputBorder(),
          hintText: text,
          labelText: text,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        );
}
