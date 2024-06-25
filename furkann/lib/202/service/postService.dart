import 'dart:io';

import 'package:dio/dio.dart';
import 'package:furkann/202/service/model.dart';

class PostService {
  final Dio networkManager;

  PostService()
      : networkManager =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  Future<bool> updateService(PostModel model) async {
    try {
      final response =
          await networkManager.post(_PostServicepaths.posts.name, data: model);

      return response.statusCode == HttpStatus.created;
    } catch (_) {}
    return false;
  }

  Future<List<PostModel>?> fetchPostItems() async {
    try {
      final response = await networkManager.get(_PostServicepaths.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}

enum _PostServicepaths {
  posts,
  users,
  comments,
}
