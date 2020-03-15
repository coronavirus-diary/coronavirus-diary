import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:coronavirus_diary/src/ui/widgets/question_view.dart';
import 'index.dart';

class IntroStep extends StatefulWidget implements CheckupStep {
  @override
  _IntroStepState createState() => _IntroStepState();
}

class _IntroStepState extends State<IntroStep> {
  @override
  Widget build(BuildContext context) {
    return QuestionView(
      questions: [
        Question(
          title: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: FaIcon(
                  FontAwesomeIcons.check,
                  color: Colors.white.withOpacity(0.7),
                  size: 100,
                ),
              ),
              Text(
                "It's time for your checkup. This blurb will prepare you for it and highlight your right to submit only the data that you choose.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
