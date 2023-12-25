import 'package:barebaskets/components/my_drawer.dart';
import 'package:barebaskets/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(title: const Text("Shop Page"),
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      elevation: 0.0,),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          //shop subtitle
          Center(child:
            Text("Pick from a selected list of premium products",
            style:TextStyle(color: Theme.of(context).colorScheme.inversePrimary) ,)),
          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context,index){
                  //get each product from shop
                  final product = products[index];
                  //return as a product tile UI
                  return MyProductTile(product: product);
                }),
          ),
        ],
      )
    );
  }
}
