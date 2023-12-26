import 'package:barebaskets/models/product.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier{
  //products for sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price:199.79,
      description:"Item Description goes here like this...........",
      imagePath: 'assets/images/hoodie.png'
    ),
    Product(
      name: "Product 2",
      price:169.00,
      description:"Item Description",
      imagePath: 'assets/images/shades.png'
    ),
    Product(
      name: "Product 3",
      price:99.99,
      description:"Item Description",
      imagePath: 'assets/images/shoes.png'
    ),
    Product(
      name: "Product 4",
      price:799.99,
      description:"Item Description",
      imagePath: 'assets/images/watch.png'
    ),
  ];
  //user cart
  final List<Product> _cart=[];

  //get product list
  List<Product> get shop => _shop;

  //get user cart list
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }

}