// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  late final _$googleSignInAtom =
      Atom(name: '_UserStore.googleSignIn', context: context);

  @override
  GoogleSignIn? get googleSignIn {
    _$googleSignInAtom.reportRead();
    return super.googleSignIn;
  }

  @override
  set googleSignIn(GoogleSignIn? value) {
    _$googleSignInAtom.reportWrite(value, super.googleSignIn, () {
      super.googleSignIn = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_UserStore.currentUser', context: context);

  @override
  GoogleSignInAccount? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(GoogleSignInAccount? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$userAtom = Atom(name: '_UserStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_UserStore.userName', context: context);

  @override
  String? get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String? value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$handleSignInAsyncAction =
      AsyncAction('_UserStore.handleSignIn', context: context);

  @override
  Future<int?> handleSignIn() {
    return _$handleSignInAsyncAction.run(() => super.handleSignIn());
  }

  late final _$handleSignOutAsyncAction =
      AsyncAction('_UserStore.handleSignOut', context: context);

  @override
  Future<void> handleSignOut() {
    return _$handleSignOutAsyncAction.run(() => super.handleSignOut());
  }

  @override
  String toString() {
    return '''
googleSignIn: ${googleSignIn},
currentUser: ${currentUser},
user: ${user},
userName: ${userName}
    ''';
  }
}
