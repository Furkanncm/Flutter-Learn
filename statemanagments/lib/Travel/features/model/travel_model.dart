import 'package:json_annotation/json_annotation.dart';

part 'travel_model.g.dart';

@JsonSerializable()
class TravelModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  @JsonKey(includeFromJson: false)
  bool isFav = false;

  TravelModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory TravelModel.fromJson(Map<String, dynamic> json) {
    return _$TravelModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TravelModelToJson(this);
  }
}
