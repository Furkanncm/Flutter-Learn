import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/network_model.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends NetworkModel<TestModel> {
  int? userId;
  int? id;
  String? title;
  String? body;

  TestModel({this.userId, this.id, this.title, this.body});

  @override
  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }
}
