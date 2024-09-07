import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:furkann/303/mvvm_Mobx/features/photo/viewmodel/PostViewModel.dart';

class Postview extends StatelessWidget {
  Postview({super.key});

  final _viewmodel = PostViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        return _viewmodel.isLoading
            ? Center(child: const CircularProgressIndicator.adaptive())
            : ListView.builder(
                itemCount: _viewmodel.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Scaffold(
                              appBar: AppBar(),
                              body: Center(
                                child: Column(
                                  children: [
                                    Text(_viewmodel.items[index].title
                                        .toString()),
                                    Text(
                                        _viewmodel.items[index].url.toString()),
                                    Image.network(_viewmodel
                                        .items[index].thumbnailUrl
                                        .toString())
                                  ],
                                ),
                              ),
                            );
                          }));
                        },
                        title: Text(_viewmodel.items[index].title.toString()),
                        subtitle: Text(_viewmodel.items[index].url.toString()),
                        leading: Image.network(
                            _viewmodel.items[index].thumbnailUrl.toString())),
                  );
                },
              );
      }),
    );
  }
}
