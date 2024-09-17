import 'package:flutter/material.dart';

import '../../basket/view/basket_view.dart';
import '../../favorite/favorite_view.dart';
import '../../photos/view/photos_view.dart';

class TabbarModel {
  final String title;
  final Icon icon;
  final Widget page;

  TabbarModel({required this.title, required this.icon, required this.page});
}

class TabModelItems {
  static final String Photos = "Photos";
  static final String Basket = "Basket";
  static final String Favorites = "Favorites";
  static final List<TabbarModel> items = [
    TabbarModel(
      title: Photos,
      icon: Icon(Icons.pageview_outlined),
      page: PhotosView(),
    ),
    TabbarModel(
      title: Favorites,
      icon: Icon(Icons.favorite_outline_outlined),
      page: FavoriteView(),
    ),
    TabbarModel(
      title: Basket,
      icon: Icon(Icons.shopping_basket_outlined),
      page: BasketView(),
    ),
  ];
}
