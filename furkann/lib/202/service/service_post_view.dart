import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furkann/202/service/model.dart';
import 'package:dio/dio.dart';

class ServicePostModel extends StatefulWidget {
  const ServicePostModel({super.key});

  @override
  State<ServicePostModel> createState() => _ServicePostModelState();
}

class _ServicePostModelState extends State<ServicePostModel> {
  late final TextEditingController _titleController;
  late final TextEditingController _bodyController;
  late final TextEditingController _userIdController;

  late final Dio _networkManager;
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  final String title = "Title";
  final String body = "Body";
  final String userId = "UserId";
  final String check = "Check & Post";
  String appbarTitle = "Service Post Model";

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _userIdController = TextEditingController();
  }

  Future<void> updateService(PostModel model) async {
    final response = await _networkManager.post("/posts", data: model);
    if (response.statusCode == HttpStatus.created) {
      print("success");
    }
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
                child: _customTextField(
                    controller: _userIdController,
                    text: userId,
                    inputType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _customTextField(
                  controller: _titleController,
                  text: title,
                  inputType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _customTextField(
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
                        final _model = PostModel(
                            title: _titleController.text,
                            body: _bodyController.text,
                            userId: int.tryParse(_userIdController.text));
                        updateService(_model);
                      }
                    },
                    icon: Icon(Icons.check),
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

class _customTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType inputType;
  const _customTextField({
    Key? key,
    required this.controller,
    required this.text,
    required this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: text,
        hintText: text,
        border: OutlineInputBorder(),
      ),
    );
  }
}
