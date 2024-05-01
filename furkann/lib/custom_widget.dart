import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class customWidget extends StatelessWidget {
  const customWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Center(child: circularRedIndicator())],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LinearProgressIndicator(
            color: Colors.white,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const customButton(text: "Add to Card")),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          customButton(text: "Food"),
          Center(child: circularRedIndicator()),
        ],
      ),
    );
  }
}

class circularRedIndicator extends StatelessWidget {
  const circularRedIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 5,
    );
  }
}

class customButton extends StatelessWidget {
  final String text;
  const customButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, shape: const StadiumBorder()),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }
}

class customPadding {
  static final paddingsl = EdgeInsets.all(8);
}
