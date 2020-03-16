import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/ui/router.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Diary'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, ActivityScreen.routeName),
                child: Text('Enter social activity'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, CheckupScreen.routeName),
                child: Text('Start checkup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
