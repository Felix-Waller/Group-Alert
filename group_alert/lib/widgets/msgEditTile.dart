import 'package:flutter/material.dart';
import 'package:group_alert/other/helperFunctions.dart';

class MsgEditTile extends StatefulWidget {
  final String sharedPrefKey;
  final String defaultText;

  MsgEditTile(this.sharedPrefKey, this.defaultText);

  @override
  MsgEditTileState createState() => new MsgEditTileState();
}

class MsgEditTileState extends State<MsgEditTile> {
  String text;
  TextEditingController textEditController;

  @override
  initState() {
    text = widget.defaultText;
    getText().then((value) => text = value ?? text);
    textEditController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: Icon(Icons.edit),
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Center(child: Text('Edit Text')),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "Edit Text"),
                        controller: textEditController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              textEditController.text = "";
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Done'),
                            onPressed: () {
                              setState(() {
                                if (textEditController.text != null &&
                                    textEditController.text != "") {
                                  this.text = textEditController.text;
                                }
                              });
                              textEditController.text = "";
                              HelperFunctions.saveTextSharedPreference(
                                  this.text, widget.sharedPrefKey);
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ));
      },
    );
  }

  Future<String> getText() async {
    return await HelperFunctions.getTextSharedPreference(widget.sharedPrefKey);
  }
}
