
import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  @JsonKey(includeFromJson:true)
  List<Recipes>? recipes;
  int? total;
  int? skip;
  int? limit;

  FoodModel({this.recipes, this.total, this.skip, this.limit});

 factory FoodModel.fromJson(Map<String, dynamic> json) {
    return _$FoodModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
   return _$FoodModelToJson(this);
  }
}

@JsonSerializable()
class Recipes {
  int? id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  int? servings;
  String? difficulty;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  int? userId;
  String? image;
  double? rating;
  int? reviewCount;
  List<String>? mealType;

  Recipes(
      {this.id,
      this.name,
      this.ingredients,
      this.instructions,
      this.prepTimeMinutes,
      this.cookTimeMinutes,
      this.servings,
      this.difficulty,
      this.cuisine,
      this.caloriesPerServing,
      this.tags,
      this.userId,
      this.image,
      this.rating,
      this.reviewCount,
      this.mealType});

 factory Recipes.fromJson(Map<String, dynamic> json) {

    return _$RecipesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecipesToJson(this);
  }
}
