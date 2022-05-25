// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_PostStore.loading'))
      .value;

  final _$fetchPostsFutureAtom = Atom(name: '_PostStore.fetchPostsFuture');

  @override
  ObservableFuture<PostList?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<PostList?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$postListAtom = Atom(name: '_PostStore.postList');

  @override
  PostList? get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(PostList? value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  final _$successAtom = Atom(name: '_PostStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$getBusinessPlacesAsyncAction =
      AsyncAction('_PostStore.getBusinessPlaces');

  @override
  Future<dynamic> getBusinessPlaces() {
    return _$getBusinessPlacesAsyncAction.run(() => super.getBusinessPlaces());
  }

  final _$uploadChatImageAsyncAction =
      AsyncAction('_PostStore.uploadChatImage');

  @override
  Future<dynamic> uploadChatImage(dynamic image) {
    return _$uploadChatImageAsyncAction.run(() => super.uploadChatImage(image));
  }

  final _$getBusinessSpacesAsyncAction =
      AsyncAction('_PostStore.getBusinessSpaces');

  @override
  Future<dynamic> getBusinessSpaces() {
    return _$getBusinessSpacesAsyncAction.run(() => super.getBusinessSpaces());
  }

  final _$getSearchEventAsyncAction = AsyncAction('_PostStore.getSearchEvent');

  @override
  Future<dynamic> getSearchEvent(dynamic searchQuery) {
    return _$getSearchEventAsyncAction
        .run(() => super.getSearchEvent(searchQuery));
  }

  final _$checkContactsAsyncAction = AsyncAction('_PostStore.checkContacts');

  @override
  Future<dynamic> checkContacts(dynamic contacts) {
    return _$checkContactsAsyncAction.run(() => super.checkContacts(contacts));
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
postList: ${postList},
success: ${success},
loading: ${loading}
    ''';
  }
}
