import 'package:flutter/material.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({super.key});

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView> {
  Color _backgroundColorBlue = Colors.blueGrey;
  Color _backgroundColorAmber = Colors.amberAccent;
  bool isAmber = true;

  void changebg() {
    setState(() {
      isAmber = !isAmber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: isAmber ? _backgroundColorBlue : _backgroundColorAmber,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              backgroundColor: Colors.indigo,
              context: context,
              builder: (context) {
                return CustomSheet();
              });

          if (result is bool) {
            changebg();
          }
        },
        child: Icon(Icons.share),
      ),
    );
  }
}

class CustomSheet extends StatefulWidget {
  const CustomSheet({
    super.key,
  });

  @override
  State<CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<CustomSheet> {
  bool isColor = true;

  void _changeColor() {
    setState(() {
      isColor = !isColor;
    });
  }

  Color _color = Colors.indigo;
  Color _color2 = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isColor ? _color : _color2,
        borderRadius: BorderRadius.circular(12), // Köşeleri yuvarla
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: Colors.grey,
              thickness: 3,
              indent: MediaQuery.of(context).size.width / 3,
              endIndent: MediaQuery.of(context).size.width / 3,
            ),
            Text("data"),
            Image.network("https://picsum.photos/seed/picsum/200/300"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _changeColor();
                        },
                      );
                    },
                    child: Icon(Icons.change_circle_outlined)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop<bool>(true);
                    },
                    child: Icon(Icons.swipe_up_sharp)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
