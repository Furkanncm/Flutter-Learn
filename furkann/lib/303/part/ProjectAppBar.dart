part of "./Partof_Learn.dart";

class _ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Title"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
