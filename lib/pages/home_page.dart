import 'package:flutter/material.dart';
import 'coffee_page.dart';
import 'tea_page.dart';
import 'bread_page.dart';
import '/pages/login_page.dart';
import '/pages/register_page.dart';
import '/model/tab.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'homePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> myTabs = [
    MyTab(
      iconPath: 'lib/icons/coffee.png',
    ),
    MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),
    MyTab(
      iconPath: 'lib/icons/burger.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
                icon:Icon(
                    Icons.person,
                color: Colors.grey[800],
                size: 36,
                ),
              onPressed: () =>
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {return
                      registerPage();
                      },
                    ),
                  ),
            ),
          ),
        ),

        body: Column(
          children: [
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  coffeePage(),
                  teaPage(),
                  breadPage(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              ),
              child: const Icon(Icons.people),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CartPage();
                    },
                  ),
                );
              },
              child: const Icon(Icons.shopping_bag),
            ),
          ],
        ),
      ),
    );
  }
}
