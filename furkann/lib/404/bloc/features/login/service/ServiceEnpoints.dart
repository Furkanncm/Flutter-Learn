enum ServiceEnpoints {
  login,
}

extension ServiceEnpointsExtensions on ServiceEnpoints {
  String get getPath {
    switch (this) {
      case ServiceEnpoints.login:
        return "/$name";
    }
  }
}
