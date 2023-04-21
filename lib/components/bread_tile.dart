import 'package:flutter/material.dart';
import 'package:orderingsystem/model/bread.dart';
import 'package:orderingsystem/model/cart_model.dart';

CartModel cartmodel = CartModel();


class BreadTile extends StatelessWidget {
  final Bread bread;
  void Function()? onPressed;
  final Widget icon;

  BreadTile({super.key,
    required this.bread,
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
            bread.name,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            bread.price as String,
            style: TextStyle(fontSize: 15),
          ),
          leading: Image.asset(bread.imagepath),
          trailing: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ));
  }
}
