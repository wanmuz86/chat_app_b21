import 'package:chatapp/widgets/employeelist.dart';
import 'package:chatapp/widgets/register.dart';
import 'package:chatapp/widgets/resetpassword.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
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

              Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeelistPage()));
            }, child: Text("Login"), color: Colors.yellow,),
            FlatButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetpasswordPage()));
            }, child: Text("Forgot Password")),
            FlatButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
            }, child: Text("No Account? Register now!"))
          ],
        ),
      ),
    );
  }
}
