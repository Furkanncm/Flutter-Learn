// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PhotoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel()
  ..albumId = (json['albumId'] as num?)?.toInt()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..url = json['url'] as String?
  ..thumbnailUrl = json['thumbnailUrl'] as String?;

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
