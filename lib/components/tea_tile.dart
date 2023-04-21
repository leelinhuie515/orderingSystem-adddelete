import 'package:flutter/material.dart';
import 'package:orderingsystem/model/cart.dart';

import '../model/tea.dart';
import 'package:orderingsystem/model/cart_model.dart';


class Teatile extends StatelessWidget {
  final Tea tea;
  void Function()? onPressed;
  final Widget icon;

  Teatile({super.key,
    required this.tea,
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
          tea.name,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          tea.price as String,
          style: TextStyle(fontSize: 15),
        ),
        leading: Image.asset(tea.imagepath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }

}

