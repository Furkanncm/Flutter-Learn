import 'package:flutter/material.dart';
import 'sharedManager.dart';
import 'sharedViewModel.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedView extends StatefulWidget {
  const SharedView({super.key});

  @override
  State<SharedView> createState() => _SharedViewState();
}

class _SharedViewState extends SharedViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(action ?? "Nothing"),
        actions: [
          isLoading
              ? CircularProgressIndicator(
                  color: Theme.of(context).scaffoldBackgroundColor,
                )
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: editingController,
            onChanged: (value) {
              changeTitle(value);
            },
          ),
          TextField(
            controller: numberController,
            onChanged: (value) {
              changeBody(int.tryParse(value) ?? 0);
            },
          ),
          TextField(
            controller: controller,
            onChanged: (value) {
              changeText(value);
            },
          ),
          ListTile(
            title: Text(text.toString()),
            subtitle: Text(number.toString()),
          ),
          const Expanded(child: _userListView())
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                sharedManager.setString(SharedKeys.input, text.toString());
              }

              if (numberController.text.isNotEmpty) {
                sharedManager.setInt(SharedKeys.number,
                    int.tryParse(numberController.text) ?? 0);
              }

              if (editingController.text.isNotEmpty) {
                sharedManager.setString(SharedKeys.action, action.toString());
              }
            },
            child: const Icon(Icons.send),
          ),
          FloatingActionButton(
            onPressed: () async {
              changeLoading();
              sharedManager.removeItem(SharedKeys.action);
              sharedManager.removeItem(SharedKeys.input);
              sharedManager.removeItem(SharedKeys.number);
              changeTitle("Nothing");
              changeLoading();
            },
            child: const Icon(Icons.remove_circle_outline_outlined),
          ),
        ],
      ),
    );
  }
}

class _userListView extends StatelessWidget {
  const _userListView();

  @override
  Widget build(BuildContext context) {
    final List<User> users = UserItems().users;
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              if (!await launchUrl(users[index].Url as Uri)) {
                throw Exception('Could not launch ${users[index].Url}');
              }
            },
            child: Card(
              child: ListTile(
                title: Text(users[index].name),
                subtitle: Text(users[index].description),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index].Url),
                ),
                trailing: Text(
                  users[index].Url,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
          );
        });
  }
}

class User {
  final String name;
  final String description;
  final String Url;

  User(this.name, this.description, this.Url);
}

class UserItems {
  List<User> users = [
    User("Furkan", "Flutter Developer", "https://github.com/Furkanncm"),
    User("Betül", "Java Developer", "https://github.com/anacbetul"),
  ];
}
