import 'package:flutter/material.dart';
import 'package:orderingsystem/model/tea.dart';

class TeaShop extends ChangeNotifier{
  // tea for sale list
  final List<Tea> _shop =[
    //tea 1
    Tea(
      name: 'Apple Tea',
      price: '3.90',
      imagepath: "lib/images/apple.png",
    ),
    //tea 2
    Tea(
      name: 'Peach Tea',
      price: '3.90',
      imagepath: "lib/images/peach.png",
    ),
    //tea 3
    Tea(
      name: 'Strawberry Tea',
      price: '7.90',
      imagepath: "lib/images/strawberry.png",
    ),
    //tea 4
    Tea(
      name: 'Lemon Tea',
      price: '5.90',
      imagepath: "lib/images/lemon.png",
    ),
  ];
  //user cart
  List<Tea> _userCart =[];
//get tea list
  List<Tea> get teaShop =>_shop;
//get user cart
  List<Tea> get userCart => _userCart;
//add item to cart
  void addItemToCart(Tea tea){
    _userCart.add(tea);
    notifyListeners();
  }
// remove item from cart
  void removeItemFromcart(Tea tea){
    _userCart.remove(tea);
    notifyListeners();
  }
}