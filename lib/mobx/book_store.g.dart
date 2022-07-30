// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookStore on _BookStore, Store {
  Computed<ObservableList<Category>>? _$categoryComputed;

  @override
  ObservableList<Category> get category => (_$categoryComputed ??=
          Computed<ObservableList<Category>>(() => super.category,
              name: '_BookStore.category'))
      .value;
  Computed<ObservableList<Book>>? _$booksComputed;

  @override
  ObservableList<Book> get books =>
      (_$booksComputed ??= Computed<ObservableList<Book>>(() => super.books,
              name: '_BookStore.books'))
          .value;
  Computed<ObservableList<Category>>? _$allCategoriesComputed;

  @override
  ObservableList<Category> get allCategories => (_$allCategoriesComputed ??=
          Computed<ObservableList<Category>>(() => super.allCategories,
              name: '_BookStore.allCategories'))
      .value;

  late final _$shouldReloadAtom =
      Atom(name: '_BookStore.shouldReload', context: context);

  @override
  bool get shouldReload {
    _$shouldReloadAtom.reportRead();
    return super.shouldReload;
  }

  @override
  set shouldReload(bool value) {
    _$shouldReloadAtom.reportWrite(value, super.shouldReload, () {
      super.shouldReload = value;
    });
  }

  late final _$currentCategoryAtom =
      Atom(name: '_BookStore.currentCategory', context: context);

  @override
  Category? get currentCategory {
    _$currentCategoryAtom.reportRead();
    return super.currentCategory;
  }

  @override
  set currentCategory(Category? value) {
    _$currentCategoryAtom.reportWrite(value, super.currentCategory, () {
      super.currentCategory = value;
    });
  }

  late final _$loadedBooksAtom =
      Atom(name: '_BookStore.loadedBooks', context: context);

  @override
  List<Book> get loadedBooks {
    _$loadedBooksAtom.reportRead();
    return super.loadedBooks;
  }

  @override
  set loadedBooks(List<Book> value) {
    _$loadedBooksAtom.reportWrite(value, super.loadedBooks, () {
      super.loadedBooks = value;
    });
  }

  late final _$allCategoryAtom =
      Atom(name: '_BookStore.allCategory', context: context);

  @override
  List<Category> get allCategory {
    _$allCategoryAtom.reportRead();
    return super.allCategory;
  }

  @override
  set allCategory(List<Category> value) {
    _$allCategoryAtom.reportWrite(value, super.allCategory, () {
      super.allCategory = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: '_BookStore.categories', context: context);

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$getBooksByIdFirstFromDatabaseAndCacheAsyncAction = AsyncAction(
      '_BookStore.getBooksByIdFirstFromDatabaseAndCache',
      context: context);

  @override
  Future<List<Book>> getBooksByIdFirstFromDatabaseAndCache() {
    return _$getBooksByIdFirstFromDatabaseAndCacheAsyncAction
        .run(() => super.getBooksByIdFirstFromDatabaseAndCache());
  }

  late final _$_BookStoreActionController =
      ActionController(name: '_BookStore', context: context);

  @override
  void changeReload(bool reload) {
    final _$actionInfo = _$_BookStoreActionController.startAction(
        name: '_BookStore.changeReload');
    try {
      return super.changeReload(reload);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCurrentCategory(Category category) {
    final _$actionInfo = _$_BookStoreActionController.startAction(
        name: '_BookStore.updateCurrentCategory');
    try {
      return super.updateCurrentCategory(category);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeElement(Category value) {
    final _$actionInfo = _$_BookStoreActionController.startAction(
        name: '_BookStore.removeElement');
    try {
      return super.removeElement(value);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addElement(Category value) {
    final _$actionInfo =
        _$_BookStoreActionController.startAction(name: '_BookStore.addElement');
    try {
      return super.addElement(value);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shouldReload: ${shouldReload},
currentCategory: ${currentCategory},
loadedBooks: ${loadedBooks},
allCategory: ${allCategory},
categories: ${categories},
category: ${category},
books: ${books},
allCategories: ${allCategories}
    ''';
  }
}
