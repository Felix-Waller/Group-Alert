import 'package:flutter/material.dart';
import 'package:group_alert/services/database.dart';

class AcceptUserTile extends StatelessWidget {
  final String chatRoomId;
  final String user;

  AcceptUserTile(this.chatRoomId, this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 0,
        right: 0),
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(23)),
          color: Colors.grey[500],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Allow $user to join the group?", textAlign: TextAlign.start, style: TextStyle(fontSize: 15.0, color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                FlatButton(
                  child: Text("Accept"),
                  onPressed: () {DatabaseMethods().addUserToGroup(chatRoomId, "testAddUser");},
                ),
                FlatButton(
                  child: Text("Decline"),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
