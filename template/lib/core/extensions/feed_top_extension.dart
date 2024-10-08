import '../constants/enum/feed_top_enum.dart';

extension FeedTopExtension on FeedTop {
  String get rawValue {
    switch (this) {
      case FeedTop.LASTEST:
        return 'Lastest';
      case FeedTop.DECORATICE:
        return 'Decorative';
      case FeedTop.MUSIC:
        return 'Music';
      case FeedTop.STYLE:
        return 'Style';
    }
  }
}
