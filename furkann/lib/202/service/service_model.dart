import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furkann/202/model_learn.dart';
import 'package:furkann/202/service/model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  final _baseUrl = "https://jsonplaceholder.typicode.com";
  late final Dio _networkManager;

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
    
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    changeLoading();
    final response = await _networkManager.get("/posts");
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }

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
      body: Padding(
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
        title: Text(_model?.title ?? " "),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
