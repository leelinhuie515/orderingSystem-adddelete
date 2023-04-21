import 'package:flutter/material.dart';
import 'package:orderingsystem/pages/bread_page.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'package:collection/collection.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  // final List _shopItems = const [
  //   // [ itemName, itemPrice, imagePath, color ]
  //   ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
  //   ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
  //   ["Chicken", "12.80", "lib/images/chicken.png", Colors.brown],
  //   ["Water", "1.00", "lib/images/water.png", Colors.blue],
  // ];

  // list of cart items
  List<Cart> _cartItems = [];

  List<Cart> get cartItems => _cartItems;

  void addToCart(Cart cart){
    _cartItems.add(cart);
    notifyListeners();
    print('item added');
    print(_cartItems.contains(cart));
  }

  // get shopItems => _shopItems;
  //
  // // add item to cart
  // void addItemToCart(int index) {
  //   _cartItems.add(_shopItems[index]);
  //   notifyListeners();
  // }

  // remove item from cart
  void removeItemFromCart(Cart cart) {
    _cartItems.remove(cart);
    notifyListeners();
  }

  // calculate total price
  double calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i].price);
    }
    print(totalPrice);
    return totalPrice;
  }
}
