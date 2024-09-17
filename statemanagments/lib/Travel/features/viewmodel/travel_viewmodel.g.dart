// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TravelViewModel on _TravelViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_TravelViewModelBase.isLoading', context: context);

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

  late final _$isVisibleTopAtom =
      Atom(name: '_TravelViewModelBase.isVisibleTop', context: context);

  @override
  bool get isVisibleTop {
    _$isVisibleTopAtom.reportRead();
    return super.isVisibleTop;
  }

  @override
  set isVisibleTop(bool value) {
    _$isVisibleTopAtom.reportWrite(value, super.isVisibleTop, () {
      super.isVisibleTop = value;
    });
  }

  late final _$isVisibleBottomAtom =
      Atom(name: '_TravelViewModelBase.isVisibleBottom', context: context);

  @override
  bool get isVisibleBottom {
    _$isVisibleBottomAtom.reportRead();
    return super.isVisibleBottom;
  }

  @override
  set isVisibleBottom(bool value) {
    _$isVisibleBottomAtom.reportWrite(value, super.isVisibleBottom, () {
      super.isVisibleBottom = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: '_TravelViewModelBase.items', context: context);

  @override
  List<TravelModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<TravelModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$markedAtom =
      Atom(name: '_TravelViewModelBase.marked', context: context);

  @override
  List<TravelModel> get marked {
    _$markedAtom.reportRead();
    return super.marked;
  }

  @override
  set marked(List<TravelModel> value) {
    _$markedAtom.reportWrite(value, super.marked, () {
      super.marked = value;
    });
  }

  late final _$fetchItemsAsyncAction =
      AsyncAction('_TravelViewModelBase.fetchItems', context: context);

  @override
  Future<void> fetchItems() {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems());
  }

  late final _$_TravelViewModelBaseActionController =
      ActionController(name: '_TravelViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_TravelViewModelBaseActionController.startAction(
        name: '_TravelViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_TravelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsVisibleTop() {
    final _$actionInfo = _$_TravelViewModelBaseActionController.startAction(
        name: '_TravelViewModelBase.changeIsVisibleTop');
    try {
      return super.changeIsVisibleTop();
    } finally {
      _$_TravelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsVisibleBottom() {
    final _$actionInfo = _$_TravelViewModelBaseActionController.startAction(
        name: '_TravelViewModelBase.changeIsVisibleBottom');
    try {
      return super.changeIsVisibleBottom();
    } finally {
      _$_TravelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveModel(TravelModel model) {
    final _$actionInfo = _$_TravelViewModelBaseActionController.startAction(
        name: '_TravelViewModelBase.saveModel');
    try {
      return super.saveModel(model);
    } finally {
      _$_TravelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isVisibleTop: ${isVisibleTop},
isVisibleBottom: ${isVisibleBottom},
items: ${items},
marked: ${marked}
    ''';
  }
}
