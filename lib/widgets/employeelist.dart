import 'package:chatapp/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class EmployeelistPage extends StatefulWidget {


  // 1) Create a variable to store the userId
  final String userId;
  final String userEmail;
  // Create the constructor as well
  EmployeelistPage({this.userId, this.userEmail});

  @override
  _EmployeelistPageState createState() => _EmployeelistPageState();
}

class _EmployeelistPageState extends State<EmployeelistPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee List"),
        actions: [IconButton(icon: Icon(Icons.android_sharp), onPressed: (){
print('pressed');
          Navigator.push(context,MaterialPageRoute(
              builder: (context) => ProfilePage(userId: widget.userId,)));
        }

        )],


      ),

      // Streambuilder and FutureBuild is Another way to call API/Firebase/Data from database , Everything that have the future or strem
      body:StreamBuilder(
        // Get me all the documents inside users collection (retrieve the data)
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
       // show it on the UI..
        builder: (context, snapshot){
          if (!snapshot.hasData){
            return CircularProgressIndicator();
          }else {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,position){
                  if (snapshot.data.docs[position]["id"] == widget.userId){
                    return Container();
                  }
                  else {
                    return ListTile(
                      title: Text(snapshot.data.docs[position]["email"]),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>ChatPage(userId:widget.userId,
                            friendId:snapshot.data.docs[position]["id"], userEmail: widget.userEmail,friendEmail:
                          snapshot.data.docs[position]["email"],)));
                      }
                    );
                  }
                });
          }
        },
      )
    );
  }
}
