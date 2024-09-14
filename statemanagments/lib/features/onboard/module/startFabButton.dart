part of '../view/on_board_view.dart';

class _Startfabbutton extends StatelessWidget {
  const _Startfabbutton({
    required this.isNotLastPage,
    this.onPressed,
  });
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
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
