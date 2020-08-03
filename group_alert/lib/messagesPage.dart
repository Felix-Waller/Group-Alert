import 'package:flutter/material.dart';
import 'package:group_alert/appBar.dart' show MyAppBar;
import 'package:group_alert/msgListCard.dart' show ListViewCard;

class MessagesView extends StatefulWidget {
  @override
  MessagesViewState createState() => MessagesViewState();
}

class MessagesViewState extends State<MessagesView> {
  List<String> msgList = [
  'Lunch Time!', 'Supper Time!', 'Bedtime!', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ReorderableListView(
        onReorder: _onReorder,
        scrollDirection: Axis.vertical,
        children: List.generate(
          msgList.length,
          (index) {
            return ListViewCard(
              msgList,
              index,
              Key('$index'),
            );
          }
        )
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = msgList.removeAt(oldIndex);
        msgList.insert(newIndex, item);
      },
    );
  }
}
