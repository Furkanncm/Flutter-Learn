part of 'MobxService.dart';

enum _MobxserviceEndpoints { FACTS }

extension MobxserviceEndpointsExtensions on _MobxserviceEndpoints {
  String get endpoint {
    switch (this) {
      case _MobxserviceEndpoints.FACTS:
        return "/todos";
    }
  }
}
