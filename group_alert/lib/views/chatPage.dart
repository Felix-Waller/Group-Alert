import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_alert/services/database.dart';
import 'package:group_alert/widgets/acceptUserTile.dart';
import 'package:group_alert/widgets/menuButton.dart';
import 'package:group_alert/widgets/messageTile.dart';

class ChatPage extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;

  ChatPage({
    this.groupId,
    this.userName,
    this.groupName,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot> _chats;
  TextEditingController messageEditingController = new TextEditingController();

  Widget _chatMessages() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,70),
      child: StreamBuilder(
        stream: _chats,
        builder: (context, snapshot) {
          return snapshot.hasData ? ListView.builder(
            reverse: true,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              /* if (snapshot.data.documents[index].data["sender"] != "acceptUser") {
                return MessageTile(
                  message: snapshot.data.documents[index].data["text"],
                  sender: snapshot.data.documents[index].data["sender"],
                  sentByMe: widget.userName == snapshot.data.documents[index].data["sender"],
                );
              } else {
                return AcceptUserTile(snapshot.data.documents[index].data["text"]);
              } */
              if (snapshot.data.documents[snapshot.data.documents.length - index - 1].data["sender"] != "acceptUser") {
                return MessageTile(
                  message: snapshot.data.documents[snapshot.data.documents.length - index - 1].data["text"],
                  sender: snapshot.data.documents[snapshot.data.documents.length - index - 1].data["sender"],
                  sentByMe: widget.userName == snapshot.data.documents[snapshot.data.documents.length - index - 1].data["sender"],
                );
              } else {
                return AcceptUserTile(widget.groupId, snapshot.data.documents[snapshot.data.documents.length - index - 1].data["text"]);
              }
            }
          )
          : Container();
        },
      ),
    );
  }

  _sendMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "text": messageEditingController.text,
        "sender": widget.userName,
        'time': DateTime.now(),
      };

      DatabaseMethods().addMessage(widget.groupId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DatabaseMethods().getChats(widget.groupId).then((val) {
      setState(() {
        _chats = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
        ),
        title: Center(child: Text(widget.groupName)),
        actions: <Widget>[
          MyMenuButton(),
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[ 
            _chatMessages(),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                color: Colors.grey[500],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Send a message ...",
                            hintStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 16,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    GestureDetector(
                      onTap: () {
                        _sendMessage();
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Icon(Icons.send, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
