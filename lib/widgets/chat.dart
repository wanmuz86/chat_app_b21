import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  var list = [{"from":"Muzaffar","message":"Hello"},{"from":"Esha","message":"Hello Muzaffar"},
    {"from":"Muzaffar","message":"We will do the class on Tuesday next week"}, {"from":"Esha","message":"Ok. roger that"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your message"
                    ),
                  ),
                ),
                FlatButton(onPressed: (){

                }, child: Text("Send message"), color: Colors.yellow,)
              ]
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, position){
                return Card(
                  color: Colors.yellow,
                  child: ListTile(
                  title: Text(list[position]["message"]),
                    subtitle: Text(list[position]["from"]),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
