import 'package:flutter/material.dart';

import 'package:flutter_cubit/feature/login/model/response_model.dart';

class LoginDetailView extends StatelessWidget {
  final ResponseModel model;
  const LoginDetailView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(model.token ?? "fukrna"),
      ),
    );
  }
}
