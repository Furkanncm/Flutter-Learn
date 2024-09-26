// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$itemsAtom =
      Atom(name: '_LoginViewModelBase.items', context: context);

  @override
  List<TestModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<TestModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$fetchItemsAsyncAction =
      AsyncAction('_LoginViewModelBase.fetchItems', context: context);

  @override
  Future<List<TestModel>> fetchItems() {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems());
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
