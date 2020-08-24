import 'package:flutter/material.dart';
import 'package:group_alert/widgets/menuButton.dart';

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
        MyMenuButton(),
      ],
    );
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
