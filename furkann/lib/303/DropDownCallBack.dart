import 'package:flutter/material.dart';
import 'package:furkann/303/Dropdown.dart';

class CallbackDrop extends StatefulWidget {
  const CallbackDrop({super.key, required this.onSelected,});

   final void Function(PublicUser userItem) onSelected;
  @override
  State<CallbackDrop> createState() => _CallbackDropState();
}

class _CallbackDropState extends State<CallbackDrop> {
  PublicUser? selectedUser;

  void _changeUser(PublicUser? item) {
    setState(() {
      selectedUser = item;
    });
    if(item!=null){
      widget.onSelected.call(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedUser,
        items: PublicUser.dummyUsers()
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.email),
                ))
            .toList(),
        onChanged: _changeUser);
  }
}
