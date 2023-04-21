import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
                child: Row(
                  children: [
                    Text(
                      ' Welcome to 15Cafe!',
                      style: TextStyle(fontSize: 34, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              // username textfield
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
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
                    onChanged: (value){
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => () async {
                  try {
                    var userLoggedIn = await _auth.signInWithEmailAndPassword(
                        email: email!, password: password!);
                    if (userLoggedIn != null)
                      Navigator.pushNamed(context, HomePage.id);
                  } catch(e) {
                    print(e);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(35,16,35,16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blueGrey[900],
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