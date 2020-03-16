import 'package:coronavirus_diary/src/ui/router.dart';
import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/ui/screens/activity/activity_list.dart';

class ActivityScreen extends StatefulWidget {
  static const routeName = '/activity';

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My activity'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () => Navigator.pushNamed(
                    context, ActivityCreateScreen.routeName),
                child: Text('Add an activity'),
              ),
            ),
            Expanded(
              child: ActivityList(),
            ),
          ],
        ),
      ),
    );
  }
}
