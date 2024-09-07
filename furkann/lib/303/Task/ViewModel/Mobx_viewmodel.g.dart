// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Mobx_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxViewModel on _MobxViewModelBase, Store {
  late final _$itemsAtom =
      Atom(name: '_MobxViewModelBase.items', context: context);

  @override
  List<ToDoModel>? get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<ToDoModel>? value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MobxViewModelBase.isLoading', context: context);

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

  late final _$getItemFromServiceAsyncAction =
      AsyncAction('_MobxViewModelBase.getItemFromService', context: context);

  @override
  Future<void> getItemFromService() {
    return _$getItemFromServiceAsyncAction
        .run(() => super.getItemFromService());
  }

  late final _$_MobxViewModelBaseActionController =
      ActionController(name: '_MobxViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MobxViewModelBaseActionController.startAction(
        name: '_MobxViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MobxViewModelBaseActionController.endAction(_$actionInfo);
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
