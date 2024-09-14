// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_vievmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhotosViewModel on _PhotosViewModelBase, Store {
  late final _$itemsAtom =
      Atom(name: '_PhotosViewModelBase.items', context: context);

  @override
  List<PhotosModel>? get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<PhotosModel>? value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PhotosViewModelBase.isLoading', context: context);

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

  late final _$fetchItemsFromServiceAsyncAction = AsyncAction(
      '_PhotosViewModelBase.fetchItemsFromService',
      context: context);

  @override
  Future<void> fetchItemsFromService() {
    return _$fetchItemsFromServiceAsyncAction
        .run(() => super.fetchItemsFromService());
  }

  late final _$_PhotosViewModelBaseActionController =
      ActionController(name: '_PhotosViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_PhotosViewModelBaseActionController.startAction(
        name: '_PhotosViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_PhotosViewModelBaseActionController.endAction(_$actionInfo);
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
