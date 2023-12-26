
import 'package:barebaskets/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
   const CartPage({super.key});

   void removeItemFromCart(BuildContext context,Product product){
     showDialog(
       context: context,
       builder: (context) => AlertDialog(
         content: const Text("Remove this item from cart?"),
         actions: [
           //cancel btn
           MaterialButton(
             onPressed:()=>Navigator.pop(context),
             child: const Text("Cancel"),
           ),
           //ok btn
           MaterialButton(
             onPressed:(){

               Navigator.pop(context);
               context.read<Shop>().removeFromCart(product);
             },
             child: const Text("Yes"),
           ),
         ],
       ),
     );
   }

   void payButtonPressed(BuildContext context){
     showDialog(
         context: context,
         builder: (context)=> const AlertDialog(
           content: Text("User wants to pay! Connect this app to your payment backend"),
         ),
     );
   }


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;


    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty ?const Center(child:  Text("Your cart is empty..",)): ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context,index){
              final item = cart[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('\$'+item.price.toStringAsFixed(2)),
                trailing:  IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => removeItemFromCart(context,item),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: cart.isNotEmpty ? MyButton(onTap:() => payButtonPressed(context), child: const Text("Pay Now")):const Text(""),
          )
        ],
      ),
    );
  }
}
