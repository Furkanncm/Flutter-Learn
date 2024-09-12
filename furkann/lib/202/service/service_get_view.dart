
import 'package:flutter/material.dart';
import 'comment_learn_view.dart';
import 'model.dart';
import 'postService.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final IService _postService;

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
        title: _isLoading ?const Text("Furkan") :const Text("Service Learn"),
        actions: [
          _isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? const Placeholder()
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommentLearnView(postId: _model?.id,)));
          
        },
        title: Text(
          _model?.title ?? " ",
          style: const TextStyle(color: Colors.amber),
        ),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
