import 'package:flutter/material.dart';
import 'appBar.dart';

class SettingsView extends StatefulWidget {
  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text(getUsername()),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {}, // show edit profile
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Center(child: Text('Reset', style: TextStyle(color: Colors.red))),
                      onTap: () {}, // show reset app data dialog
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getUsername() {
    return 'John Doe';
  }
}
