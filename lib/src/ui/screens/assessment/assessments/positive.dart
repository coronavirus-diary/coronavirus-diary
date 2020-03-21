import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/ui/widgets/share.dart';

class PositiveAssessment extends StatefulWidget {
  @override
  _PositiveAssessmentState createState() => _PositiveAssessmentState();
}

class _PositiveAssessmentState extends State<PositiveAssessment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              '🤔',
              style: TextStyle(fontSize: 70),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Please contact your physician",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "You are showing symptoms that may be of concern. "
              "Please limit your contact with other people until you have a chance to follow up with a physician.",
              style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Do not panic. This is only a preliminary assessment and not a formal medical diagnosis.",
              style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          ShareApp(),
        ],
      ),
    );
  }
}
