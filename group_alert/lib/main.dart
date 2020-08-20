import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_alert/views/homePage.dart';
import 'package:group_alert/views/loadingPage.dart';
import 'package:group_alert/views/messagesPage.dart';
import 'package:group_alert/views/settingsPage.dart';
import 'package:group_alert/views/signInPage.dart';
import 'package:group_alert/views/signUpPage.dart';

import 'other/helperFunctions.dart';
import 'other/theme.dart';

void main() async {
  runApp(LoadingScreen());
  runApp(MyApp(await getLoggedInState()));
}

Future<bool> getLoggedInState() async {
  return await HelperFunctions.getUserLoggedInSharedPreference();
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Alert',
      theme: MyTheme.lightTheme(),
      home: new LoadingPageView(),
    );
  }
}

class MyApp extends StatelessWidget {
  final bool userIsLoggedIn;

  MyApp(this.userIsLoggedIn);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Group Alert',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),

      initialRoute: userIsLoggedIn != null ? (userIsLoggedIn ? '/' : '/signIn') : '/signIn',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new HomeView(),
        '/messages': (BuildContext context) => new MessagesView(),
        '/settings': (BuildContext context) => new SettingsView(),
        '/signIn': (BuildContext context) => new SignInView(),
        '/signUp': (BuildContext context) => new SignUpView(),
      },
    );
  }
}
