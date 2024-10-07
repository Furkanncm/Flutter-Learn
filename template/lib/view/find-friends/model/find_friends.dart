import 'package:json_annotation/json_annotation.dart';

part 'find_friends.g.dart';

@JsonSerializable()
class FindFriends {
  List<Carts>? carts;
  int? total;
  int? skip;
  int? limit;

  FindFriends({this.carts, this.total, this.skip, this.limit});

  factory FindFriends.fromJson(Map<String, dynamic> json) {
    return _$FindFriendsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FindFriendsToJson(this);
  }
}

@JsonSerializable()
class Carts {
  int? id;
  List<Products>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts({this.id, this.products, this.total, this.discountedTotal, this.userId, this.totalProducts, this.totalQuantity});

  factory Carts.fromJson(Map<String, dynamic> json) {
    return _$CartsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartsToJson(this);
  }
}

@JsonSerializable()
class Products {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  Products({this.id, this.title, this.price, this.quantity, this.total, this.discountPercentage, this.discountedTotal, this.thumbnail});

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsToJson(this);
  }
}
