import 'package:flutter/material.dart';
import 'package:group_alert/other/helperFunctions.dart';
import 'package:group_alert/widgets/appBar.dart';
import 'package:group_alert/services/auth.dart';

class SettingsView extends StatefulWidget {
  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  String userName = '';
  @override
  Widget build(BuildContext context) {
    HelperFunctions.getUserNameSharedPreference().then((value) {
      setState(() {
        userName = value;
      });
    });
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // profile edit
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(userName),
                  trailing: Icon(Icons.edit),
                  onTap: () {},
                ),
              ),

              // change password
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                  trailing: Icon(Icons.chevron_right),
                )
              ),
              // messages edit
              Card(
                margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Lunch Time!'),
                      trailing: Icon(Icons.edit),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    ListTile(
                      title: Text('Dinner Time!'),
                      trailing: Icon(Icons.edit),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    ListTile(
                      title: Text('Bedtime!'),
                      trailing: Icon(Icons.edit),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // notifications enable
              Card(
                margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SwitchListTile(
                  title: Text('Notifications'),
                  value: true,
                  onChanged: (val) {},
                )
              ),

              // danger zone
              Card(
                margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Center(
                        child: Text('Reset', style: TextStyle(color: Colors.red))),
                      onTap: () {
                        AuthService().signOut(); 
                        // add other saved preferences as they are implemented
                        Navigator.of(context).pushReplacementNamed('/signIn');
                      },
                    ),
                    _buildDivider(),
                    ListTile(
                      title: Center(
                        child: Text('Delete Account', style: TextStyle(color: Colors.red))),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Delete Account?'),
                            content:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    AuthService().deleteAccount();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushReplacementNamed('/signIn');
                                  },
                                ),
                              ]
                            )
                          )
                        );
                      },
                    ),
                    _buildDivider(),
                    ListTile(
                      title: Center(
                        child: Text('Log Out', style: TextStyle(color: Colors.red))),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Log Out?'),
                            content:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    AuthService().signOut();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushReplacementNamed('/signIn');
                                  },
                                ),
                              ]
                            )
                          )
                        );
                      },
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

  Container _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 1.0,
      color: Theme.of(context).backgroundColor
    );
  }
}
