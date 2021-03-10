import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter your password"
              ),
            ),
            FlatButton(onPressed: (){

            }, child: Text("Register"), color: Colors.yellow,),

          ],
        ),
      ),
    );
  }
}
