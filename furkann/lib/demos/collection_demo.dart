import 'package:flutter/material.dart';

class collectionDemo extends StatefulWidget {
  const collectionDemo({super.key});

  @override
  State<collectionDemo> createState() => _collectionDemoState();
}

late final List<contextCard> _items;

class _collectionDemoState extends State<collectionDemo> {
  @override
  void initState() {
    super.initState();
    _items = ProjectItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.grey[600],
                child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Image.asset(_items[index].image),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(_items[index].title),
                              Text(_items[index].money.toString()),
                            ])
                      ],
                    )));
          }),
    );
  }
}

class contextCard {
  final String image;
  final String title;
  final double money;

  contextCard({
    required this.image,
    required this.title,
    required this.money,
  });
}

class ProjectItems {
  late final List<contextCard> items;
  ProjectItems(){
    items = [
      contextCard(
        image: "assets/indir.png",
        title: "Food 1",
        money: 10.0,
      ),
      contextCard(
        image: "assets/indir.png",
        title: "Food 2",
        money: 20.0,
      ),
      contextCard(
        image: "assets/indir.png",
        title: "Food 3",
        money: 30.0,
      ),
      contextCard(
        image: "assets/indir.png",
        title: "Food 4",
        money: 40.0,
      ),
      contextCard(
        image: "assets/indir.png",
        title: "Food 5",
        money: 50.0,
      ),
      contextCard(
        image: "assets/indir.png",
        title: "Food 6",
        money: 60.0,
      ),
    ];
    
  }
}