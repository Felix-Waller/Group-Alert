import 'package:flutter/material.dart';
import 'package:group_alert/services/database.dart';
import 'package:group_alert/widgets/appBar.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  String selected;
  String groupId = 'A8pyc3cw1LQG53NuliXb';
  String userName = 'felix';
  String groupName = 'groupTest1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 3 favourite msgs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                child: Text('Lunch Time!'),
                onPressed: () {selected = "Lunch Time!";},
                color: Theme.of(context).backgroundColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                child: Text('Supper Time!'),
                onPressed: () {selected = "SupperTime!";},
                color: Theme.of(context).backgroundColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                child: Text('Bedtime!'),
                onPressed: () {selected = "Bedtiume!";},
                color: Theme.of(context).backgroundColor,
              ),
            ),

            // send
            ButtonTheme(
              height: MediaQuery.of(context).size.width * 0.33,
              child: RaisedButton(
                child: Text("Send!"),
                onPressed: () {
                  if (selected != null) {
                    Map<String, dynamic> chatMessageMap = {
                      "text": selected,
                      "sender": userName,
                      'time': DateTime.now(),
                    };

                    DatabaseMethods().addMessage(groupId, chatMessageMap);

                    selected = null;
                  }
                },
                color: Theme.of(context).accentColor,
                shape: CircleBorder(),
                elevation: 5,
              ),
            ),

            // other msgs
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {},
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width - 100,
                    child: FlatButton(
                      child: Text('Meeting!'),
                      onPressed: () {},
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {},
                  ),
                ]),

            Divider(),
          ],
        ));
  }
}
