import 'package:flutter/material.dart';
import 'package:orderingsystem/components/coffee_tile.dart';
import 'package:orderingsystem/model/cart_model.dart';
import 'package:orderingsystem/model/coffee.dart';
import 'package:orderingsystem/model/coffee_shop.dart';
import 'package:provider/provider.dart';
import '../components/cart_tile.dart';
import '../model/cart.dart';
import 'home_page.dart';

CartModel cartmodel = CartModel();

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Cart cart) {
    Provider.of<CartModel>(context, listen: false).removeItemFromCart(cart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Let's order fresh items for you
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // list view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      Cart eachCart = value.cartItems[index];
                      return CartTile(
                        cart: eachCart,
                        onPressed: () => removeFromCart(eachCart),
                        icon: Icon(Icons.delete),
                      );
                    },
                  ),
                ),
              ),

              // total amount + pay now
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.blueGrey[200]),
                          ),

                          const SizedBox(height: 8),
                          Text(
                            '\$' +
                                Provider.of<CartModel>(context, listen: false)
                                    .calculateTotal()
                                    .toStringAsFixed(2),
                            style: TextStyle(color: Colors.blueGrey[200]),
                          )
                          // total price
                        ],
                      ),

                      // pay now
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey.shade200),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
