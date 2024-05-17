import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furkann/product/language/language_items.dart';

class customTextField extends StatefulWidget {
  const customTextField({super.key});

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [Icon(Icons.safety_check)],
          title: Text(LanguageItems.MainTitle),
          leading: Icon(Icons.chevron_left),
        ),
        body: Column(
          children: [
            Padding(padding: ProjectPadding.generalPadding),
            TextField(
              focusNode: focusNode1,
              textInputAction: TextInputAction.next,
              decoration: _customTextFieldDecoration(
                  Icon(Icons.person), LanguageItems.usernameTitle),
              keyboardType: TextInputType.name,
            ),
            Padding(padding: ProjectPadding.generalPadding),
            TextField(
              focusNode: focusNode2,
              decoration: _customTextFieldDecoration(
                  Icon(Icons.lock), LanguageItems.passwordTitle),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            )
          ],
        ));
  }

  InputDecoration _customTextFieldDecoration(Icon icon, String text) {
    return InputDecoration(
      prefixIcon: icon,
      border: OutlineInputBorder(),
      labelText: text,
    );
  }
}

class ProjectPadding {
  static final generalPadding = EdgeInsets.all(8.0);
}
