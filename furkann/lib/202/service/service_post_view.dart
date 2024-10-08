
import 'package:flutter/material.dart';
import 'model.dart';
import 'postService.dart';

class ServicePostModel extends StatefulWidget {
  const ServicePostModel({super.key});

  @override
  State<ServicePostModel> createState() => _ServicePostModelState();
}

class _ServicePostModelState extends State<ServicePostModel> {
  late final TextEditingController _titleController;
  late final TextEditingController _bodyController;
  late final TextEditingController _userIdController;
  late final IService _postService;
  final String title = "Title";
  final String body = "Body";
  final String userId = "UserId";
  final String check = "Check & Post";
  String appbarTitle = "Service Post Model";

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _userIdController = TextEditingController();
  }

  Future<void> updateService(PostModel model) async {
    final response = await _postService.postItemService(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appbarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customTextField(
                    controller: _userIdController,
                    text: userId,
                    inputType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customTextField(
                  controller: _titleController,
                  text: title,
                  inputType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customTextField(
                    controller: _bodyController,
                    text: body,
                    inputType: TextInputType.text),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (_userIdController.text.isNotEmpty &&
                          _titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty) {
                        final  model = PostModel(
                            title: _titleController.text,
                            body: _bodyController.text,
                            userId: int.tryParse(_userIdController.text));
                        updateService(model);
                      }
                    },
                    icon: const Icon(Icons.check),
                    label: Text(check),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shadowColor: Colors.blue,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}

class customTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType inputType;
  const customTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: text,
        hintText: text,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
