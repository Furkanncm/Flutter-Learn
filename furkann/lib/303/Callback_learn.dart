import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CallbackLearn extends StatefulWidget {
  const CallbackLearn({super.key});

  @override
  State<CallbackLearn> createState() => _CallbackLearnState();
}

class _CallbackLearnState extends State<CallbackLearn> {
  DropdownUser? selectedUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DropdownButton<DropdownUser>(
              value: selectedUser,
              items: DropdownUser.dummyUsers()
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: (DropdownUser? user) {
                setState(() {
                  selectedUser = user;
                });
              })
        ],
      ),
    );
  }
}

class DropdownUser {
  final String name;
  final int id;

  DropdownUser(this.name, this.id);

  static List<DropdownUser> dummyUsers() {
    return [
      DropdownUser("Furkan", 1),
      DropdownUser("Ahmet", 2),
      DropdownUser("Mehmet", 3),
      DropdownUser("Ali", 4),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DropdownUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
