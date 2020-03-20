import 'package:flutter/material.dart';

class AssessmentScreen extends StatelessWidget {
  static const routeName = '/checkup/assessment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Personalized Assessment'),
      ),
    );
  }
}
