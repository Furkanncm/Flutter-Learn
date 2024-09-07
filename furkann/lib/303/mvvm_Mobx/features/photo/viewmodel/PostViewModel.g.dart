// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostViewModel on _PostviewModelBase, Store {
  late final _$itemsAtom =
      Atom(name: '_PostviewModelBase.items', context: context);

  @override
  List<PhotoModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<PhotoModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PostviewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchPhotosAsyncAction =
      AsyncAction('_PostviewModelBase.fetchPhotos', context: context);

  @override
  Future<void> fetchPhotos() {
    return _$fetchPhotosAsyncAction.run(() => super.fetchPhotos());
  }

  late final _$_PostviewModelBaseActionController =
      ActionController(name: '_PostviewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_PostviewModelBaseActionController.startAction(
        name: '_PostviewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_PostviewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
isLoading: ${isLoading}
    ''';
  }
}
