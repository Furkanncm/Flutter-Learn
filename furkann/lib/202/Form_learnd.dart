import 'package:flutter/material.dart';

class TextFormLearn extends StatefulWidget {
  const TextFormLearn({super.key});

  @override
  State<TextFormLearn> createState() => _TextFormLearnState();
}

class _TextFormLearnState extends State<TextFormLearn> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  _myOptions? _options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              const validateField(),
              const SizedBox(
                height: 50,
              ),
              const validateField(),
              ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState?.validate() ?? false) {}
                  },
                  child: const Text("Save")),
              DropdownButtonFormField(
                  hint: const Text("Choose the item"),
                  selectedItemBuilder: (context) {
                    return _myOptions.values.map((e) => Text(e.name)).toList();
                  },
                  isDense: false,
                  elevation: 8,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  iconDisabledColor: Colors.red,
                  iconEnabledColor: Colors.amber,
                  items: _myOptions.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _options = value;
                    });
                  }),
              TextFormField(
                textInputAction: TextInputAction.next,
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: _options?.name,
                ),
                // validator: (value) {
                //   return (value?.isNotEmpty ?? false)
                //       ? null
                //       : "Name is required";
                // },
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum _myOptions { Furkan, Betul, Kazim }

extension _myOpExtension on _myOptions {
  String get name {
    switch (this) {
      case _myOptions.Furkan:
        return "Furkan";
      case _myOptions.Betul:
        return "Betul";
      case _myOptions.Kazim:
        return "Kazim";
    }
  }
}

class validateField extends StatelessWidget {
  const validateField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      validator: validate().validateText,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _notEmpty {
  final String _message = "*required";
}

class validate {
  String? validateText(String? data) {
    return (data?.isNotEmpty ?? false) ? null : _notEmpty()._message;
  }
}
