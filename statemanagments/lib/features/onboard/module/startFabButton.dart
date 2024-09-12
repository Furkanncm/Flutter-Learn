part of '../view/on_board_view.dart';

class _Startfabbutton extends StatelessWidget {
  const _Startfabbutton({
    Key? key,
    required this.isNotLastPage,
    this.onPressed,
  }) : super(key: key);
  final String nextText = "Next";
  final String startText = "Start";
  final bool isNotLastPage;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Text(
        isNotLastPage ? nextText : startText,
        style: TextStyle(color: Colors.white),
      ),
    );
    ;
  }
}
