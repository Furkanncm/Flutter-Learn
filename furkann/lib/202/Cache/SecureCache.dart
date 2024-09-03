import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheView extends StatefulWidget {
  const SecureCacheView({super.key});

  @override
  State<SecureCacheView> createState() => SecureCacheViewState();
}

enum Keys { titleKey }

class SecureCacheViewState extends State<SecureCacheView> {
  final storage = const FlutterSecureStorage();
  String title = "";

  Future<void> saveItems(String data) async {
    await storage.write(key: Keys.titleKey.name, value: data);
  }

  @override
  void initState() {
    super.initState();
    getItems(Keys.titleKey);
  }

  Future<void> getItems(Keys key) async {
    title = await storage.read(key: key.name) ?? "Nothing";
    setState(() {
      title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    void changeTitle(String value) {
      setState(() {
        title = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: TextField(onChanged: changeTitle),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          await saveItems(title);
        },
      ),
    );
  }
}
