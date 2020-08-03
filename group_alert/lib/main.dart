import 'package:flutter/material.dart';
import 'package:group_alert/homePage.dart' show HomeView;
import 'package:group_alert/messagesPage.dart' show MessagesView;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Alert',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorBrightness: Brightness.light,
        accentColor: Colors.blueAccent,
        accentColorBrightness: Brightness.light,
        backgroundColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/messages', // debugging only
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new HomeView(),
        '/messages': (BuildContext context) => new MessagesView(),
      },
    );
  }
}
