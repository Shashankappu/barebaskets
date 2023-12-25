import 'package:barebaskets/pages/cart_page.dart';
import 'package:barebaskets/pages/introPage.dart';
import 'package:barebaskets/pages/shop_page.dart';
import 'package:barebaskets/themes/lightmode.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'models/shop.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create:(context) => Shop(),
    child:const HomePage())
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const  IntroPage(),
      routes: {
        '/intro_page':(context)=> const IntroPage(),
        '/shop_page':(context)=> const ShopPage(),
        '/cart_page':(context)=> const CartPage(),
      },
      theme: lightMode,
    );
  }
}
