import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_apple_store/views/home_page.dart';

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // defaultTransition: Transition.zoom,
      // getPages: [
      //   GetPage(name: '/', page: () => const HomePage()),
      //   // GetPage(name: '/favourites', page: () => const FavouritePage()),
      //   GetPage(name: '/details', page: () =>  DetailsPage(getIndex: index,)),
      //   // GetPage(name: '/carts', page: ()=> const CartPage ()),
      // ],
      home: HomePage(),
    ),
  ));
}
