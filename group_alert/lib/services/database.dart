import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  // create new user
  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  // fetch user data
  getUserInfo(String email) async {
    var a = FirebaseFirestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
    return a;
  }

  // fetch usernames
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .getDocuments();
  }

  // create new group
  addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  // get messages from group
  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  // add message to group
  addMessage(String chatRoomId, chatMessageData) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  // get messages user has sent
  getUserChats(String itIsMyName) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
}
