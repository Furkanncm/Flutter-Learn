enum RouteEnum{
  HOME
} 


extension RouteEnumExtension on RouteEnum{
  String get route{
    switch(this){
      case RouteEnum.HOME:
        return '/$name';
    }
  }

}