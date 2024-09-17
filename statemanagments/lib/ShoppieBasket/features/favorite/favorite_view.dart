import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Login&OnBoard/product/padding/page_padding.dart';
import '../../product/manager/shop/shop_manager.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Favorites")),
      ),
      body: Padding(
        padding: PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ShopManager>(
                builder: (context, value, child) {
                  return _ListView(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView _ListView(BuildContext context) {
    return ListView.builder(
        itemCount: context.read<ShopManager>().favoriteItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Image.network(
                    context.read<ShopManager>().favoriteItems[index].url ?? ""),
              ),
              title: Text(
                  context.read<ShopManager>().favoriteItems[index].title ?? ""),
              trailing: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  context.read<ShopManager>().addFavorite(
                      context.read<ShopManager>().favoriteItems[index]);
                },
              ),
            ),
          );
        });
  }
}
