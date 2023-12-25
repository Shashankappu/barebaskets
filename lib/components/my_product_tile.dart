import 'package:flutter/material.dart';
import '../models/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const  MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               AspectRatio(
                 aspectRatio: 1,
                 child: Container(
                     decoration: BoxDecoration(
                       color: Theme.of(context).colorScheme.secondary,
                       borderRadius: BorderRadius.circular(12),
                     ),
                     width: double.infinity,
                     padding: const EdgeInsets.all(25),
                     child: const Icon(Icons.favorite),
                 ),
               ),
               const  SizedBox(height: 25,),
               //product name
               Text(product.name,
                 style: const TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                 ),
               ),
             ],
           ),
          //Product description
          Text(product.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),

          const  SizedBox(height: 25,),

          //product price + add to cart button
          Text("\$"+product.price.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
