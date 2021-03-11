import 'package:chatapp/widgets/employeelist.dart';
import 'package:chatapp/widgets/register.dart';
import 'package:chatapp/widgets/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Enter your email"),
                controller: emailController,
              ),
              TextField(
                  decoration: InputDecoration(hintText: "Enter your password"),
                  controller: passwordController),
              FlatButton(
                onPressed: () async {
                  User user = (await _auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text))
                      .user;
                  if (user != null) {
                    print("User succesfully logged in");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployeelistPage(userId: user.uid, userEmail:user.email)));
                  } else {
                    print("error");
                  }
                },
                child: Text("Login"),
                color: Colors.yellow,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetpasswordPage()));
                  },
                  child: Text("Forgot Password")),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: Text("No Account? Register now!"))
            ],
          ),
        ),
      ),
    );
  }
}
