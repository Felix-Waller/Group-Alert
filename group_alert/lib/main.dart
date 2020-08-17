import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_alert/views/homePage.dart';
import 'package:group_alert/views/messagesPage.dart';
import 'package:group_alert/views/settingsPage.dart';
import 'package:group_alert/views/signInPage.dart';
import 'package:group_alert/views/signUpPage.dart';
import 'package:group_alert/widgets/helperFunctions.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Group Alert',
      debugShowCheckedModeBanner: false,
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

      initialRoute: userIsLoggedIn != null ? userIsLoggedIn ? '/' : '/signIn' : '/signIn',
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
