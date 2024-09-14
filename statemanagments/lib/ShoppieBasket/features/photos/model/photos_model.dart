import 'package:json_annotation/json_annotation.dart';

part 'photos_model.g.dart';

@JsonSerializable()
class PhotosModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  @JsonKey(includeFromJson: false)
  int productCount = 1;
  @JsonKey(includeFromJson: false)
  double price = 25;
  @JsonKey(includeFromJson: false)
  bool isFavorite = false;

  PhotosModel();

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return _$PhotosModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhotosModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotosModel &&
        other.albumId == albumId &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumbnailUrl.hashCode;
  }
}
