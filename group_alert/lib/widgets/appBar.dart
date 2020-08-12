import 'package:flutter/material.dart';

enum Menu { home, messages, settings }

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize;

  @override
  MyAppBarState createState() => MyAppBarState();
}

class MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
        ),
      title: Center(child: Text(getTitle())),
      actions: <Widget>[
        PopupMenuButton(
          onSelected: menuPressed,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
            const PopupMenuItem<Menu>(
              value: Menu.home,
              child: Text('Home'),
            ),
            const PopupMenuItem<Menu>(
              value: Menu.messages,
              child: Text('Messages'),
            ),
            const PopupMenuItem<Menu>(
              value: Menu.settings,
              child: Text('Settings'),
            ),
          ],
        ),
      ],
    );
  }

  void menuPressed(Menu choice) {
    switch (choice) {
      case Menu.home:
        {
          Navigator.of(context).pushReplacementNamed('/');
        }
        break;
      case Menu.messages:
        {
          Navigator.of(context).pushReplacementNamed('/messages');
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

  String getTitle() {
    switch (ModalRoute.of(context).settings.name) {
      case '/':
        {
          return 'Home';
        }
        break;
      case '/messages':
        {
          return 'Messages';
        }
        break;
      case '/settings':
        {
          return 'Settings';
        }
        break;
      default:
        {
          return 'Group Alert';
        }
        break;
    }
  }
}
