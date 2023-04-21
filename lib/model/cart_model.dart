import 'package:flutter/material.dart';
import 'cart.dart';

class CartModel extends ChangeNotifier {

  // list of cart items
  List<Cart> _cartItems = [];

  List<Cart> get cartItems => _cartItems;

  void addToCart(Cart cart){
    _cartItems.add(cart);
    notifyListeners();
    print('item added');
    print(_cartItems.contains(cart));
  }

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
