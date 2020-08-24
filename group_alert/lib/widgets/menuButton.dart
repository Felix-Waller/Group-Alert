import 'package:flutter/material.dart';
import 'package:group_alert/views/chatPage.dart';

enum Menu { home, chat, settings }

class MyMenuButton extends StatefulWidget {
  @override
  MyMenuButtonState createState() => MyMenuButtonState();
}

class MyMenuButtonState extends State<MyMenuButton>{
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: menuPressed,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        const PopupMenuItem<Menu>(
          value: Menu.home,
          child: Text('Home'),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.chat,
          child: Text('Chat')
          ),
        const PopupMenuItem<Menu>(
          value: Menu.settings,
          child: Text('Settings'),
        ),
      ],
    );
  }

  menuPressed(Menu choice) {
    switch (choice) {
      case Menu.home:
        {
          Navigator.of(context).pushReplacementNamed('/');
        }
        break;
      case Menu.chat:{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => 
            ChatPage(groupId: 'A8pyc3cw1LQG53NuliXb', userName: 'felix', groupName: 'groupTest1',)));
      }
      break;
      case Menu.settings:
        {
          Navigator.of(context).pushReplacementNamed('/settings');
        }
        break;
      default:
        {
          return null;
        }
    }
  }
}
