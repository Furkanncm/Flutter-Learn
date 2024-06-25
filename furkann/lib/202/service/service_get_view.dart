import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furkann/202/model_learn.dart';
import 'package:furkann/202/service/model.dart';
import 'package:furkann/202/service/postService.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final PostService _postService;

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchPostItems();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    changeLoading();
    _items = await _postService.fetchPostItems();
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isLoading ? Text("Furkan") : Text("Service Learn"),
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? Placeholder()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: _items?.length ?? 0,
                  itemBuilder: (context, index) {
                    return postCard(model: _items?[index]);
                  }),
            ),
    );
  }
}

class postCard extends StatelessWidget {
  const postCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          _model?.title ?? " ",
          style: TextStyle(color: Colors.amber),
        ),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
