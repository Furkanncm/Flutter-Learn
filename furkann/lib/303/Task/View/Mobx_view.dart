import 'package:flutter/material.dart';
import 'package:furkann/303/Task/ViewModel/Mobx_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:furkann/product/navigator/NavigatorRoutes.dart';

class MobxView extends StatefulWidget {
  MobxView({super.key});

  @override
  State<MobxView> createState() => _MobxViewState();
}

class _MobxViewState extends State<MobxView> {
  final _viewmodel = MobxViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Service With Mobx")),
        ),
        body: Observer(builder: (_) {
          if (_viewmodel.isLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.red,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: _viewmodel.items?.length,
              itemBuilder: (context, index) {
                bool iscompleted =
                    _viewmodel.items?[index].completed == true ?? false;
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Scaffold(
                                appBar: AppBar(),
                                body:
                                    Text(_viewmodel.items?[index].title ?? ""),
                              )));
                    },
                    title: Text(_viewmodel.items?[index].title ?? ""),
                    leading: Text(_viewmodel.items?[index].id.toString() ?? ""),
                    trailing: Checkbox(
                        value: iscompleted, onChanged: (bool? value) {}),
                  ),
                );
              },
            );
          }
        }));
  }
}
