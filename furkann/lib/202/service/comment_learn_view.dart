import 'package:flutter/material.dart';
import 'comment_model.dart';
import 'postService.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({super.key, this.postId});
  final int? postId;

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  late final IService _getService;
  bool _isLoading = false;
  List<CommentModel>? _items;

  @override
  void initState() {
    super.initState();
    _getService = PostService();
    fetchItemsWithPersonality(widget.postId ?? 0);
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithPersonality(int postId) async {
    changeLoading();
    _items = await _getService.fetchSpecificItemsService(postId);
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _items == null
              ? const Center(child: Text("No data found"))
              : ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_items?[widget.postId ?? 0].email ?? ""),
                        subtitle: Text(_items?[widget.postId ?? 0].body ?? ""),
                      ),
                    );
                  },
                ),
    );
  }
}
