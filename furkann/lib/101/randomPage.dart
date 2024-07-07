import 'package:flutter/material.dart';
import 'package:furkann/101/button.dart';

class randPage extends StatelessWidget {
  final String _title = "Create Your First Note";
  final String _description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.g, ";
  final String _texttt = "Skip";
  const randPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(),
      body: Padding(
        padding: pagePadding.yatay,
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 200,
              child: ImageView(name: ProjectImage().image),
            ),
            Padding(
              padding: pagePadding.dikey,
              child: TextWidget(title: _title),
            ),
            subtitleWidget(
              textAlign: TextAlign.center,
              subtitle: _description * 5,
            ),
            const Spacer(),
            Padding(
              padding: pagePadding.dikey,
              child: elevatedButtonWidget(buttonText2: "Create A Note"),
            ),
            TextButton(onPressed: () {}, child: Text(_texttt)),
           const  SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class elevatedButtonWidget extends StatelessWidget {
  final String buttonText2;
  const elevatedButtonWidget({
    Key? key,
    required this.buttonText2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
        ),
        onPressed: () {},
        child: elevatedButtonTextWidget(buttonText: buttonText2));
  }
}

class elevatedButtonTextWidget extends StatelessWidget {
  final String buttonText;
  const elevatedButtonTextWidget({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: Colors.white, fontSize: 15),
    );
  }
}

class subtitleWidget extends StatelessWidget {
  final String subtitle;

  const subtitleWidget({
    Key? key,
    required this.subtitle,
    this.textAlign = TextAlign.center,
  }) : super(key: key);
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      subtitle,
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String title;
  const TextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Create Your First Note",
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ));
  }
}

class pagePadding {
  static final EdgeInsets yatay = const EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets dikey = const EdgeInsets.symmetric(vertical: 10);
}

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "asset/$name.png",
      fit: BoxFit.none,
    );
  }
}

class ProjectImage {
  final String image = "indir";
}
