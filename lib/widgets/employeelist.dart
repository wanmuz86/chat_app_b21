import 'package:flutter/material.dart';
import 'package:chatapp/widgets/chat.dart';
class EmployeelistPage extends StatefulWidget {
  @override
  _EmployeelistPageState createState() => _EmployeelistPageState();
}

class _EmployeelistPageState extends State<EmployeelistPage> {
  var list = [{"name":"Muzaffar","department":"IT"},{"name":"Esha","department":"Admin"},
    {"name":"Bhawani","department":"Sales"}, {"name":"Navin","department":"Sales"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee List"),),
      body:ListView.builder(

          itemCount: list.length,
          itemBuilder: (context, position){
            return ListTile(
              title:Text(list[position]["name"]),
              subtitle: Text(list[position]["department"]),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage()));
              },
            );
          }),
    );
  }
}
