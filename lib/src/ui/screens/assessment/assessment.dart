import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/data/models/assessments.dart';
import 'assessments/index.dart';

class AssessmentScreenArguments {
  final Assessment assessment;

  AssessmentScreenArguments({this.assessment});
}

class AssessmentScreen extends StatelessWidget {
  static const routeName = '/assessment';

  @override
  Widget build(BuildContext context) {
    final AssessmentScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Personalized Assessment'),
      ),
      body: getAssessmentView(args.assessment),
    );
  }
}
