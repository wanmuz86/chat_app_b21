import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  final String userId;
  ProfilePage({this.userId});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var emailController = TextEditingController();
  var nameController = TextEditingController();

  @override
  void initState() {

    super.initState();
    this.retrieveUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name"
                ),
              ),
              TextField(
                controller: emailController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: "Email"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Phone Number"
                ),
              ),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: "Address"
                ),
              ),
              FlatButton(onPressed: (){

                FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
                  'email':emailController.text,
                  'name':nameController.text,
                });

              }, child: Text("Update User"))
            ],
          ),
        ),
      ),
    );
  }

  // Get the user Info from firebase
  void retrieveUserInfo() async {
    FirebaseFirestore.instance.collection('users').doc(widget.userId).get().then((ds){
      if (ds.exists){
        setState(() {
          nameController.text = ds.data()["name"];
          emailController.text = ds.data()["email"];

        });
      }
    });
  }
}
