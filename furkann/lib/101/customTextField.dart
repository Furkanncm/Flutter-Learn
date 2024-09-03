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
          actions: const [Icon(Icons.safety_check)],
          title: const Text(LanguageItems.MainTitle),
          leading: const Icon(Icons.chevron_left),
        ),
        body: Padding(
          padding: ProjectPadding.generalPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: ProjectPadding.generalPadding),
              TextField(
                focusNode: focusNode1,
                textInputAction: TextInputAction.next,
                decoration: _customTextFieldDecoration(
                    const Icon(Icons.person), LanguageItems.usernameTitle),
                keyboardType: TextInputType.name,
              ),
              Padding(padding: ProjectPadding.generalPadding),
              TextField(
                focusNode: focusNode2,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: _customTextFieldDecoration(
                    const Icon(Icons.email), LanguageItems.emailTitle),
              ),
              Padding(padding: ProjectPadding.generalPadding),
              TextField(
                focusNode: focusNode3,
                textInputAction: TextInputAction.next,
                decoration: _customTextFieldDecoration(
                    const Icon(Icons.lock), LanguageItems.passwordTitle),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              Padding(padding: ProjectPadding.generalPadding),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), backgroundColor: Colors.blueGrey),
                  onPressed: () {},
                  child: const Text(LanguageItems.submitTitle)),
            ],
          ),
        ));
  }

  InputDecoration _customTextFieldDecoration(Icon icon, String text) {
    return InputDecoration(
      prefixIcon: icon,
      border: const OutlineInputBorder(),
      labelText: text,
    );
  }
}

class ProjectPadding {
  static final generalPadding = const EdgeInsets.all(8.0);
}
