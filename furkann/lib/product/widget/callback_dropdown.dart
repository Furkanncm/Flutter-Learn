import 'package:flutter/material.dart';
import '../../303/Dropdown.dart';

class CallbackDropdownWidget extends StatefulWidget {
  const CallbackDropdownWidget({super.key, required this.onSelected});

  final void Function(PublicUser user) onSelected;

  @override
  State<CallbackDropdownWidget> createState() => _CallbackDropdownWidgetState();
}

class _CallbackDropdownWidgetState extends State<CallbackDropdownWidget> {
  PublicUser? currentUser;

  void _changeUser(PublicUser? selectedUser) {
    setState(() {
      currentUser = selectedUser;
    });

    if (selectedUser != null) {
      widget.onSelected.call(selectedUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<PublicUser>(
        value: currentUser,
        items: PublicUser.dummyUsers()
            .map((e) => DropdownMenuItem(value: e, child: Text(e.email)))
            .toList(),
        onChanged: _changeUser);
  }
}
