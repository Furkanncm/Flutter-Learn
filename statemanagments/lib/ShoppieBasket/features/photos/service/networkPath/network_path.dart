enum NetworkPath { photos }

extension NetworkPathExtensions on NetworkPath {
  String get _path {
    switch (this) {
      case NetworkPath.photos:
        return "/$name";
    }
  }

  String get fullPath => "https://jsonplaceholder.typicode.com${_path}";
}
