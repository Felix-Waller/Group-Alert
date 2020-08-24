import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {

  // create new user
  Future<void> addUserInfo(userData) async {    
    final FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.currentUser().then((value) => {
      Firestore.instance.collection("users").document(value.uid).setData(userData)
    }); 
  }

  // fetch user data
  getUserInfo(String email) async {
    var a = Firestore.instance
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
    return Firestore.instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .getDocuments();
  }

  // create new group
  addChatRoom(chatRoom, chatRoomId) {
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  // get messages from group
  getChats(String chatRoomId) async {
    return Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  // add message to group
  addMessage(String chatRoomId, chatMessageData) {
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  deleteUser(){
    final FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.currentUser().then((value) => {
      Firestore.instance.collection("users").document(value.uid).delete()
    });
  }
}
