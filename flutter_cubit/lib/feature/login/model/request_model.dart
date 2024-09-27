import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

@JsonSerializable()
class RequestModel {
  String? email;
  String? password;

  RequestModel({this.email, this.password});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return _$RequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestModelToJson(this);
  }
}
