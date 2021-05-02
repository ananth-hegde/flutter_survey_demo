// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomepageStore on _HomepageStore, Store {
  final _$indexAtom = Atom(name: '_HomepageStore.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$usernameAtom = Atom(name: '_HomepageStore.username');

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$_HomepageStoreActionController =
      ActionController(name: '_HomepageStore');

  @override
  void changeIndex(int newIndex) {
    final _$actionInfo = _$_HomepageStoreActionController.startAction(
        name: '_HomepageStore.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$_HomepageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
username: ${username}
    ''';
  }
}
