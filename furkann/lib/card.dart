import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cardView extends StatelessWidget {
  const cardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          CardView(child: SizedBox(
              height: 50,
              width: 400,
              child: Center(child: Text("Furkan")),
            ),
          )
          
        ],
      ),
    );
  }
}

class ProjectMargin {
  static const margin = EdgeInsets.all(25);
}

class CardView extends StatelessWidget {
  const CardView({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargin.margin,
      child: child,
     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
