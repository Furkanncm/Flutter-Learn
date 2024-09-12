import 'dart:io';

import 'package:dio/dio.dart';
import 'comment_model.dart';
import 'model.dart';

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
        queryParameters: {_PostQueryPaths.postId.name: postId});

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        return datas.map((e) => CommentModel.fromJson(e)).toList();
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
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (_) {
      return null;
    }
    return null;
  }

  // Future<List<PostModel>?> get() async {
  //   try {
  //     final response = await networkManager.get(_PostServicepaths.posts.name);
  //     if (response.statusCode == HttpStatus.ok) {
  //       final _datas = response.data;
  //       if (_datas is List) {
  //         return _datas.map((e) => PostModel.fromJson(e)).toList();
  //       }
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }

    // Future<bool> DeleteCharacterIntent(int id) async {
  //   try {
  //     final response =
  //         await networkManager.delete("${_PostServicepaths.posts.name}/ $id");

  //     return response.statusCode == HttpStatus.ok;
  //   } catch (e) {}
  //   return false;
  // }

  // Future<bool> update(PostModel model, int id) async {
  //   try {
  //     final response = await networkManager
  //         .put("${_PostServicepaths.posts.name}/$id", data: model);
  //     return response.statusCode == HttpStatus.ok;
  //   } catch (e) {}

  //   return false;
  // }
}

enum _PostServicepaths {
  posts,
  users,
  comments,
}

enum _PostQueryPaths { postId }
