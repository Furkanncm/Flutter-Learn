import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    return _instance ?? ApplicationProvider._init();
  }

  ApplicationProvider._init();

  List<SingleChildWidget> changeNotifier = [
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
  ];
}
