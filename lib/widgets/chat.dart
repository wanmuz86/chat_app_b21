import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  final String userId;
  final String friendId;
  final String userEmail;
  final String friendEmail;
  ChatPage({this.userId, this.friendId, this.userEmail, this.friendEmail});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  var groupChatId = '';

  var list = [{"from":"Muzaffar","message":"Hello"},{"from":"Esha","message":"Hello Muzaffar"},
    {"from":"Muzaffar","message":"We will do the class on Tuesday next week"}, {"from":"Esha","message":"Ok. roger that"}
  ];
  @override
  Widget build(BuildContext context) {

    var messageController = TextEditingController();
    // 1) Create the chat room code
    if (widget.userId.hashCode < widget.friendId.hashCode){
      groupChatId = '${widget.userId}-${widget.friendId}';
    }
    else {
      groupChatId = '${widget.friendId}-${widget.userId}';
    }
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
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Enter your message"
                    ),
                  ),
                ),
                FlatButton(onPressed: (){

                  FirebaseFirestore.instance.collection('messages')
                      .doc(groupChatId)
                      .collection(groupChatId)
                      .doc(DateTime.now().microsecondsSinceEpoch.toString())
                      .set({
                    'idFrom':widget.userId,
                    'emailFrom':widget.userEmail,
                    'idTo':widget.friendId,
                    'emailTo':widget.friendEmail,
                    'timestamp':DateTime.now().microsecondsSinceEpoch.toString(),
                    'content':messageController.text
                  });

                }, child: Text("Send message"), color: Colors.yellow,)
              ]
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('messages')
                .doc(groupChatId)
                .collection(groupChatId).snapshots(),
                builder: (context,snapshots){
                  if (!snapshots.hasData){
                    return CircularProgressIndicator();
                  }
                  else {
                    return ListView.builder(
                        itemCount: snapshots.data.docs.length,
                        itemBuilder: (context, position){
                          return ListTile(
                            title:Text(snapshots.data.docs[position]["emailFrom"]),
                            subtitle: Text(snapshots.data.docs[position]["content"])
                          );
                        }

                    );
                  }
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
