import 'package:json_annotation/json_annotation.dart';

part 'PhotoModel.g.dart';

@JsonSerializable()
class PhotoModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  PhotoModel();

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return _$PhotoModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$PhotoModelToJson(this);
  
  }
}
