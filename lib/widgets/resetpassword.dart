import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetpasswordPage extends StatefulWidget {


  @override
  _ResetpasswordPageState createState() => _ResetpasswordPageState();
}

class _ResetpasswordPageState extends State<ResetpasswordPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password"),),
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

            FlatButton(onPressed: (){
              _auth.sendPasswordResetEmail(email: emailController.text);
            }, child: Text("Reset my password"), color: Colors.yellow,),

          ],
        ),
      ),
    );
  }
}
