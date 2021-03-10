import 'package:flutter/material.dart';

class ResetpasswordPage extends StatefulWidget {
  @override
  _ResetpasswordPageState createState() => _ResetpasswordPageState();
}

class _ResetpasswordPageState extends State<ResetpasswordPage> {
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
            ),

            FlatButton(onPressed: (){

            }, child: Text("Reset my password"), color: Colors.yellow,),

          ],
        ),
      ),
    );
  }
}
