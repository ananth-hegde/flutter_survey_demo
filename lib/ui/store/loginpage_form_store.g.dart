// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginpage_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginPageFormStore on _LoginPageFormStore, Store {
  final _$usernameAtom = Atom(name: '_LoginPageFormStore.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$isPasswordVisibleAtom =
      Atom(name: '_LoginPageFormStore.isPasswordVisible');

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginPageFormStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_LoginPageFormStoreActionController =
      ActionController(name: '_LoginPageFormStore');

  @override
  void toggleVisibility() {
    final _$actionInfo = _$_LoginPageFormStoreActionController.startAction(
        name: '_LoginPageFormStore.toggleVisibility');
    try {
      return super.toggleVisibility();
    } finally {
      _$_LoginPageFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginPageFormStoreActionController.startAction(
        name: '_LoginPageFormStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginPageFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_LoginPageFormStoreActionController.startAction(
        name: '_LoginPageFormStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_LoginPageFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login() {
    final _$actionInfo = _$_LoginPageFormStoreActionController.startAction(
        name: '_LoginPageFormStore.login');
    try {
      return super.login();
    } finally {
      _$_LoginPageFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateAll() {
    final _$actionInfo = _$_LoginPageFormStoreActionController.startAction(
        name: '_LoginPageFormStore.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_LoginPageFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
isPasswordVisible: ${isPasswordVisible},
password: ${password}
    ''';
  }
}

mixin _$LoginPageFormErrorState on _LoginPageFormErrorState, Store {
  final _$usernameErrorAtom =
      Atom(name: '_LoginPageFormErrorState.usernameError');

  @override
  String? get usernameError {
    _$usernameErrorAtom.reportRead();
    return super.usernameError;
  }

  @override
  set usernameError(String? value) {
    _$usernameErrorAtom.reportWrite(value, super.usernameError, () {
      super.usernameError = value;
    });
  }

  final _$passwordErrorAtom =
      Atom(name: '_LoginPageFormErrorState.passwordError');

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  @override
  String toString() {
    return '''
usernameError: ${usernameError},
passwordError: ${passwordError}
    ''';
  }
}
