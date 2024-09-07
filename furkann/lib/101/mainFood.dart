import 'package:flutter/material.dart';
import 'package:furkann/101/firstPage.dart';
import 'package:furkann/101/food.dart';
import 'package:furkann/core/random_image.dart';

class mainFood extends StatelessWidget {
  final String text = "4.6";
  final String name = "Incle Banka";
  const mainFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const foodPage()));
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.amberAccent,
              )),
          title: const textWidget(text: "REVIEW"),
          actions: const [customIconButton(icon: Icon(Icons.shopping_basket))],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Stack(children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width) / 2 - 20,
                  top: 50,
                  child: _container(text: text),
                ),
                Positioned(
                  left: 160,
                  top: 140,
                  child: textWidget(text: name),
                ),
                const Positioned(
                  left: 140,
                  top: 180,
                  child: randomImage(
                    height: 200,
                  ),
                )
              ]),
            ),
            const Expanded(
              flex: 1,
              child: Card(
                color: Colors.brown,
                elevation: 3,
                shape: StadiumBorder(),
                margin: EdgeInsets.all(8),
                child: SizedBox(
                  height: 30,
                  width: 275,
                  child: Center(
                    child: textWidget(
                      text: "WE HAVE ALL TYPE OF MONEY",
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _card(
                      icon: Icon(Icons.phone),
                    ),
                    _card(icon: Icon(Icons.alarm)),
                    _card(icon: Icon(Icons.location_city))
                  ],
                )),
          ],
        ));
  }
}

class _container extends StatelessWidget {
  const _container({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.amberAccent, borderRadius: BorderRadius.circular(13)),
        child: Center(
          child: _text(
            text: text,
          ),
        ));
  }
}

class _text extends StatelessWidget {
  final String text;
  const _text({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    );
  }
}

class _card extends StatelessWidget {
  final Icon icon;
  const _card({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: icon,
    );
  }
}
