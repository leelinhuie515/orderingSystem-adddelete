import 'package:flutter/material.dart';
//Import firebase_auth.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orderingsystem/components/button.dart';
import 'package:orderingsystem/pages/home_page.dart';

class registerPage extends StatefulWidget {
  static String id = 'registerPage';

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  String? email;
  String? password;

  //Create a private FirebaseAuth instance
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register Your Account'),
        foregroundColor: Colors.black54,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        //Receive email value
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Enter your email'),
                      ),
                    ),

                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        //Receive password value
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Enter your password'),
                      ),
                    ),

                    SizedBox(height: 24.0),

                    RoundedButton(
                      color: Colors.blueGrey,
                      //Create User with Email and Password, then if successful, navigate to the ChatScreen
                      onPressed: () async {
                        try {
                          var userRegistered = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);

                          if(userRegistered != null) {
                            Navigator.pushNamed(context, HomePage.id);
                          }
                        } catch(e) {
                          print(e);
                        }
                      },
                      label: 'Register',
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
