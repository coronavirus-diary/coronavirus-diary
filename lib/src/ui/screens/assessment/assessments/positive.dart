import 'package:flutter/material.dart';

import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/widgets/stay_safe.dart';

class PositiveAssessment extends StatefulWidget {
  @override
  _PositiveAssessmentState createState() => _PositiveAssessmentState();
}

class _PositiveAssessmentState extends State<PositiveAssessment> {
  @override
  Widget build(BuildContext context) {
    return ScrollableBody(
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
          StaySafe(),
        ],
      ),
    );
  }
}
