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
      body: Center(
        child: RaisedButton(
          onPressed: () =>
              Navigator.pushNamed(context, CheckupScreen.routeName),
          child: Text('Start checkup'),
        ),
      ),
    );
  }
}
