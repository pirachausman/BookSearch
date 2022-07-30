import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:test_app/mobx/book_store.dart';
import 'package:test_app/mobx/user_store.dart';
import 'package:test_app/pages/navigation.dart';
import 'package:test_app/pages/universal/login_page.dart';

import 'pages/formal/search_book_page_formal.dart';
import 'pages/formal/stamp_collection_page_formal.dart';
import 'pages/material/search_book_page_material.dart';
import 'pages/material/stamp_collection_page_material.dart';
import 'pages/universal/collection_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BookStore bookStore = BookStore();
  UserStore userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GetMaterialApp(
        title: 'Book search',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF0F2533),
        ),
        home: userStore.user?.displayName != null
            ? NavigationScreen()
            : LoginScreen(),

        routes: {
          '/login': (BuildContext context) =>  LoginScreen(),
          '/navigation': (BuildContext context) =>  NavigationScreen(),
          '/search_material': (BuildContext context) =>  SearchBookPage(),
          '/search_formal': (BuildContext context) =>  SearchBookPageNew(),
          '/collection': (BuildContext context) =>  CollectionPage(),
          '/stamp_collection_material': (BuildContext context) =>
              StampCollectionPage(),
          '/stamp_collection_formal': (BuildContext context) =>
              StampCollectionFormalPage(),
        },
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
