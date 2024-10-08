import 'package:bloc/bloc.dart';
import '../model/card_model.dart';

class FeedCubit extends Cubit<FeedCubitState> {
  FeedCubit() : super(FeedCubitInitial());

  bool isLiked = false;

  void changeLikedState(CardModel model) {
    isLiked = model.isLiked;
    isLiked = !isLiked;
    model.isLiked = isLiked;
    print(isLiked);
    emit(IsLiked(isLiked: isLiked));
  }
}

abstract class FeedCubitState {}

class FeedCubitInitial extends FeedCubitState {}

class IsLiked extends FeedCubitState {
  final bool isLiked;

  IsLiked({required this.isLiked});
}
