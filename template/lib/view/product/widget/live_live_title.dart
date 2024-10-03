import 'package:flutter/material.dart';
import '../../../core/components/text/normal_board_text.dart';

class LiveLiveTitle extends StatelessWidget {
  final String text;
  const LiveLiveTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return NormalBoardText(
      text: text,
      textStyle: Theme.of(context).textTheme.headlineLarge ?? const TextStyle(),
    );
  }
}
