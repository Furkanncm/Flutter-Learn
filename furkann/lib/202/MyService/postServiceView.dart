import 'package:flutter/material.dart';
import 'package:furkann/202/MyService/myModel.dart';
import 'package:furkann/202/MyService/service.dart';
import 'package:furkann/202/service/service_post_view.dart';

class PostServiceView extends StatefulWidget {
  const PostServiceView({super.key});

  @override
  State<PostServiceView> createState() => _PostServiceViewState();
}

class _PostServiceViewState extends State<PostServiceView> {
  late final TextEditingController _titleController;
  late final TextEditingController _bodyController;
  late final TextEditingController _userIdController;
  late final IService _service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _userIdController = TextEditingController();
    _service = Service();
  }

  Future<void> postItems(Models model) async {
    final response = await _service.postItems(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Service View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  controller: _titleController,
                  text: "Title",
                  inputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  controller: _bodyController,
                  text: "Body",
                  inputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  controller: _userIdController,
                  text: "UserId",
                  inputType: TextInputType.number),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  if (_titleController.text.isNotEmpty &&
                      _bodyController.text.isNotEmpty &&
                      _userIdController.text.isNotEmpty) {
                    final model = Models(
                        title: _titleController.text,
                        body: _bodyController.text,
                        userId: int.tryParse(_userIdController.text));
                    postItems(model);
                  }
                },
                icon: const Icon(Icons.check_outlined),
                label: const Text("Check Post"))
          ],
        ),
      ),
    );
  }
}
