import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              GestureDetector(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.close),
                    ),
                  ),
                  onTap: () => { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return HomePage();},
                  ),
                  ),
                  },
                ),
              ),

              const SizedBox(height: 50),

              Flexible(
                flex: 2,
                child: Text(
                  'Welcome to 15Cafe!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              Flexible(
                flex:3,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  ),
                ),
              ),

              // password textfield
              Flexible(
                flex:3,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
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
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 112, 91, 222),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}