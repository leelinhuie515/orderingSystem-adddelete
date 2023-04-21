import 'package:flutter/material.dart';
import 'package:orderingsystem/model/coffee.dart';
import 'package:orderingsystem/model/cart_model.dart';

CartModel cartmodel = CartModel();

class CoffeeTitle extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;

  CoffeeTitle({super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: ListTile(
        title: Text(
          coffee.name,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          coffee.price as String,
          style: TextStyle(fontSize: 15),
        ),
        leading: Image.asset(coffee.imagepath),
        trailing: IconButton(
          icon: icon,
            onPressed: onPressed,
        ),
      ),
    );
  }
}
