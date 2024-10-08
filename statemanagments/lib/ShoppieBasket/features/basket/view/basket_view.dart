import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Login&OnBoard/product/padding/page_padding.dart';
import '../../../product/manager/shop/shop_manager.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ShopManager>(
                  builder: (context, value, child) =>
                      _listViewBuilder(context)),
            )
          ],
        ),
      ),
    );
  }

  Widget _listViewBuilder(BuildContext context) {
    return ListView.builder(
        itemCount: context.read<ShopManager>().basketItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                      context.read<ShopManager>().basketItems[index].url ?? ""),
                ),
                title: Text(context
                        .read<ShopManager>()
                        .basketItems[index]
                        .title
                        .toString() ??
                    ""),
                trailing: IconButton(
                    onPressed: () {
                      context.read<ShopManager>().removeFromBasket(
                          context.read<ShopManager>().basketItems[index]);
                    },
                    icon: Icon(Icons.delete_outline_outlined))),
          );
        });
  }
}
