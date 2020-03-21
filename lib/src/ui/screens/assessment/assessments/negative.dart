import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:coronavirus_diary/src/ui/widgets/share.dart';

class NegativeAssessment extends StatefulWidget {
  @override
  _NegativeAssessmentState createState() => _NegativeAssessmentState();
}

class _NegativeAssessmentState extends State<NegativeAssessment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: FaIcon(
              FontAwesomeIcons.solidSmile,
              color: Colors.white,
              size: 70,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "You don't meet testing criteria",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "If you continue to experience symptoms, please check in tomorrow.",
              style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "If they become serious, please consult a physician.",
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
