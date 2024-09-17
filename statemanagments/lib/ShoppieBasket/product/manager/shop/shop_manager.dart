import 'package:flutter/material.dart';

import '../../../features/photos/model/photos_model.dart';

class ShopManager extends ChangeNotifier {
  List<PhotosModel> basketItems = [];
  bool isMarketed = false;
  double total = 0;
  List<PhotosModel> favoriteItems = [];

  void addFavorite(PhotosModel model) {
    model.isFavorite = !model.isFavorite;
    if (model.isFavorite) {
      favoriteItems.add(model);
    } else {
      favoriteItems.remove(model);
    }
    notifyListeners();
  }

  void changeMarketed() {
    isMarketed = !isMarketed;
    notifyListeners();
  }

  void addToBasket(PhotosModel model) {
    basketItems.add(model);
    notifyListeners();
  }

  void removeFromBasket(PhotosModel model) {
    basketItems.remove(model);
    model.productCount = 0;
    notifyListeners();
  }

  void addItem(PhotosModel model) {
    if (model.productCount < 0) {
      return;
    } else {
      model.productCount++;
      notifyListeners();
    }
  }

  void removeItem(PhotosModel model) {
    if (model.productCount < 0) {
      return;
    } else {
      model.productCount--;
      notifyListeners();
    }
  }

  double TotalBasketPrice() {
    total = 0;
    for (var element in basketItems) {
      total += element.productCount * element.price;
    }
    return total;
  }
}
