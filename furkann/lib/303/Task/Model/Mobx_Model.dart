import 'package:json_annotation/json_annotation.dart';
part "Mobx_Model.g.dart";

@JsonSerializable()
class ToDoModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;
  ToDoModel();

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return _$ToDoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ToDoModelToJson(this);
  }
}
