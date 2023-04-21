import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{
  //coffee for sale list
  final List<Coffee>  _shop = [
    //black coffee
    Coffee(
      name:'Americano',
      price:'4.10',
      imagepath: "lib/images/americano.jpeg",
    ),
    //latte
    Coffee(
      name:'Latte',
      price:'4.20',
      imagepath: "lib/images/latte.jpeg",
    ),
    //espresso
    Coffee(
      name:'Espresso',
      price:'3.50',
      imagepath: "lib/images/espresso.jpeg",
    ),
    //iced coffee
    Coffee(
      name:'Iced Coffee',
      price:'4.40',
      imagepath: "lib/images/icedcoffee.jpeg",
    ),
  ];
  //user cart
  List<Coffee> _userCart = [];
  //get coffee list
  List<Coffee> get coffeeShop => _shop;
  //get user cart
  List<Coffee> get userCart => _userCart;
  //add item to cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }
  //remove item from cart
  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}