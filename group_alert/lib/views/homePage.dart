import 'package:flutter/material.dart';
import 'package:group_alert/other/helperFunctions.dart';
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

  String text1 = "Lunch Time!";
  String text2 = "Dinner Time!";
  String text3 = "Bedtime!";

  @override
  Widget build(BuildContext context) {
    getText().then((val) => {
      setState(() {
        text1 = val[0] ?? text1;
        text2 = val[1] ?? text2;
        text3 = val[2] ?? text3;
      })
    });

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
                child: Text(text1),
                onPressed: () {
                  selected = text1;
                },
                color: Theme.of(context).backgroundColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                child: Text(text2),
                onPressed: () {
                  selected = text2;
                },
                color: Theme.of(context).backgroundColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                child: Text(text3),
                onPressed: () {
                  selected = text3;
                },
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
          ],
        ));
  }

  Future<List<String>> getText() async {
    List<String> myList = List<String>(3);
    myList[0] = await HelperFunctions.getTextSharedPreference('TEXT1KEY');
    myList[1] = await HelperFunctions.getTextSharedPreference('TEXT2KEY');
    myList[2] = await HelperFunctions.getTextSharedPreference('TEXT3KEY');
    return myList;
  }
}
