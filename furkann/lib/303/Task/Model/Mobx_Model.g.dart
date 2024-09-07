// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Mobx_Model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoModel _$ToDoModelFromJson(Map<String, dynamic> json) => ToDoModel()
  ..userId = (json['userId'] as num?)?.toInt()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..completed = json['completed'] as bool?;

Map<String, dynamic> _$ToDoModelToJson(ToDoModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
