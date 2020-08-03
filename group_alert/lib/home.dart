import 'package:flutter/material.dart';
import 'package:group_alert/appBar.dart' show MyAppBar;

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Center(
            child: IntrinsicWidth(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 3 favourite msgs
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 40,
                child: FlatButton(
                  child: Text('Lunch Time!'),
                  onPressed: () {},
                  color: Theme.of(context).backgroundColor,
                )),
            FlatButton(
              child: Text('Supper Time!'),
              onPressed: () {},
              color: Theme.of(context).backgroundColor,
            ),
            FlatButton(
              child: Text('Bedtime!'),
              onPressed: () {},
              color: Theme.of(context).backgroundColor,
            ),

            // send
            Expanded(
              child: RaisedButton(
                child: Text("Send!"),
                onPressed: () {},
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
              FlatButton(
                child: Text('Meeting!'),
                onPressed: () {},
                color: Theme.of(context).backgroundColor,
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {},
              ),
            ]),
            Divider(),
          ],
        ))));
  }
}
