import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:group_alert/homePage.dart' show HomeView;
import 'package:group_alert/messagesPage.dart' show MessagesView;
import 'package:group_alert/settingsPage.dart' show SettingsView;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Group Alert',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorBrightness: Brightness.light,
        accentColor: Colors.blueAccent,
        accentColorBrightness: Brightness.light,
        backgroundColor: Colors.grey[300],
        canvasColor: Colors.grey[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: '/', // debugging only
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new HomeView(),
        '/messages': (BuildContext context) => new MessagesView(),
        '/settings': (BuildContext context) => new SettingsView(),
      },
    );
  }
}
