import 'package:flutter/material.dart';
import 'package:orderingsystem/model/cart_model.dart';
import 'package:orderingsystem/model/cart.dart';
import 'package:provider/provider.dart';


 class CartTile extends StatelessWidget {
   final Cart cart;
   void Function()? onPressed;
   final Widget icon;

   CartTile({super.key,
     required this.cart,
     required this.onPressed,
     required this.icon,
   });

   @override
   Widget build(BuildContext context){
     return Padding(
       padding: const EdgeInsets.all(12.0),
       child: Container(
         decoration: BoxDecoration(
             color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
         child: ListTile(
           leading: Image.asset(
             cart.imagepath,
             height: 36,
           ),
           title: Text(
             cart.name,
             style: const TextStyle(fontSize: 18),
           ),
           subtitle: Text(
             '\$' + cart.price,
             style: const TextStyle(fontSize: 12),
           ),
           trailing: IconButton(
               icon: const Icon(Icons.cancel),
               onPressed: onPressed
           ),
         ),
       ),
     );
   }

 }
