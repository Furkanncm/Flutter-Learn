import 'dart:io';

import 'package:dio/dio.dart';
import 'package:furkann/202/service/comment_model.dart';
import 'package:furkann/202/service/model.dart';

abstract class IService {
  Future<bool> postItemService(PostModel model);
  Future<bool> updateItemservice(PostModel model, int id);
  Future<bool> deleteItemservice(int id);
  Future<List<PostModel>?> fetchPostItems();
  Future<List<CommentModel>?> fetchSpecificItemsService(int id);
}

class PostService implements IService {
  final Dio networkManager;

  PostService()
      : networkManager =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> postItemService(PostModel model) async {
    try {
      final response =
          await networkManager.post(_PostServicepaths.posts.name, data: model);

      return response.statusCode == HttpStatus.created;
    } catch (_) {}
    return false;
  }

  @override
  Future<List<CommentModel>?> fetchSpecificItemsService(int postId) async {
    final response = await networkManager.get(_PostServicepaths.comments.name,
        queryParameters: {"${_PostQueryPaths.postId.name}": postId});

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        return _datas.map((e) => CommentModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  @override
  Future<bool> updateItemservice(PostModel model, int id) async {
    try {
      final response = await networkManager
          .put("${_PostServicepaths.posts.name}/$id", data: model);

      return response.statusCode == HttpStatus.ok;
    } catch (_) {}
    return false;
  }

  @override
  Future<bool> deleteItemservice(int id) async {
    try {
      final response =
          await networkManager.delete("${_PostServicepaths.posts.name}/$id");

      return response.statusCode == HttpStatus.ok;
    } catch (_) {}
    return false;
  }

  @override
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

enum _PostQueryPaths { postId }
