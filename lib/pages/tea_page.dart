import 'package:flutter/material.dart';
import 'package:orderingsystem/components/tea_tile.dart';
import 'package:orderingsystem/model/cart.dart';
import 'package:orderingsystem/model/tea_shop.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../model/tea.dart';

class teaPage extends StatefulWidget {
  const teaPage({Key? key}) : super(key: key);

  @override
  State<teaPage> createState() => _teaPageState();
}

class _teaPageState extends State<teaPage> {
  //add tea to cart
  void addToCart(Tea tea) {
    Provider.of<CartModel>(context, listen: false).addToCart(Cart(
        name: tea.name, price: tea.price, imagepath: tea.imagepath));
    //notifies user item has been Added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            tea.name+'\n'+'Item Added',
            textAlign: TextAlign.center,
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Column(
          children: [
            Text(
              "Tea",
              style: TextStyle(
                fontSize: 45,
                fontFamily: 'Modern Love',
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                  itemCount: value.teaShop.length,
                  itemBuilder: (context, index) {
                    //get individual tea
                    Tea eachTea = value.teaShop[index];
                    //return the tile for this tea
                    return Teatile(
                      tea: eachTea,
                      icon: Icon(Icons.add),
                      onPressed: () => addToCart(eachTea),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
