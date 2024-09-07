
import 'package:flutter/material.dart';
import 'package:furkann/303/DropDownCallBack.dart';
import 'package:furkann/product/widget/button-/customAnswerButton.dart';
import 'package:furkann/product/widget/button-/loadingButton.dart';

class DropdownLearn extends StatefulWidget {
  const DropdownLearn({super.key});

  @override
  State<DropdownLearn> createState() => _DropdownLearnState();
}

class _DropdownLearnState extends State<DropdownLearn> {
  String? userNumber;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CallbackDrop(onSelected: (PublicUser userItem) {
              setState(() {
                selectedValue = userItem.email;
              });
            }),

            Text(selectedValue ?? ""),
            // CallbackDropdownWidget(onSelected: (PublicUser user) {}),
            TextField(
              onChanged: (value) {
                setState(() {
                  userNumber = value;
                });
              },
            ),
            CustomAnswer(onNumber: (int answer) {
              return userNumber == answer.toString();
            }),
            LoadingButton(
              title: "Furkan",
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PublicUser {
  final String name;
  final String email;
  final int id;

  PublicUser(this.name, this.email, this.id);

  static List<PublicUser> dummyUsers() {
    return [
      PublicUser("John", "john@gmail.com", 1),
      PublicUser("Furkan", "furkankazimc@gmail.com", 2),
      PublicUser("Betül", "betul.anac@gmail.com", 3)
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PublicUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
