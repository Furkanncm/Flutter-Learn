import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furkann/202/MyService/Tab.dart';

class MySheetView extends StatefulWidget {
  const MySheetView({super.key});

  @override
  State<MySheetView> createState() => _MySheetViewState();
}

class _MySheetViewState extends State<MySheetView> with ProductSheetMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                showCustomSheet(context, Expanded(child: Tabbar()));
              },
              child: Icon(Icons.share),
            ),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: EdgeInsets.zero,
                        child: InteractiveViewer(
                          child: Image.network(
                            "https://picsum.photos/200",
                            fit: BoxFit.cover,
                            height: 400,
                          ),
                        ),
                      );
                    });
              },
              child: Icon(Icons.face_2_rounded),
            )
          ],
        ));
  }
}

class _customSheet extends StatelessWidget {
  const _customSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
            thickness: 3,
            color: Colors.grey,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close)),
          ),
          child
        ],
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        context: context,
        builder: (context) {
          return _customSheet(
            child: child,
          );
        });
  }
}
