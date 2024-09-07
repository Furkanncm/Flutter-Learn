enum Serviceendpoints { photos }

extension ServiceendpointsExtensions on Serviceendpoints {
  String get withRoute {
    switch (this) {
      case Serviceendpoints.photos:
        return "/${Serviceendpoints.photos.name}";
    }
  }
}
