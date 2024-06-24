import 'package:flutter/material.dart';

class PostModel12 {
   int _UserId;
   int _id;
   String _title;
   String _body;

  PostModel12(
      {required int UserId,
      required int id,
      required String title,
      required String body})
      : _UserId = UserId,
        _id = id,
        _title = title,
        _body = body;

  String get gettitle => _title;
  
  String get getbody => _body;
  int get getid => _id;
  int get getUserid => _UserId;

  set settitle ( String title){
    _title = title;
  }
  void set setbody (String body){
    _body = body;
  }

  

  }


