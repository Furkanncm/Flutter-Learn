part of "./Partof_Learn.dart";

class _ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ProjectAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Title"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
