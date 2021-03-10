import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

    FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter your email"
              ),
              controller: emailController,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter your password"
              ),
              controller: passwordController,
            ),
            FlatButton(onPressed: () async {

              User user = (await _auth.createUserWithEmailAndPassword(email: emailController.text,
                  password: passwordController.text)).user;

              if (user != null){
                print("Succefully logged in");
              }
              else {
                print("Something is wrong");
              }

            }, child: Text("Register"), color: Colors.yellow,),

          ],
        ),
      ),
    );
  }
}
