import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:coronavirus_diary/src/ui/widgets/question_view.dart';
import 'package:coronavirus_diary/src/ui/widgets/simple_slider.dart';
import 'index.dart';

class BreathStep extends StatefulWidget implements CheckupStep {
  @override
  _BreathStepState createState() => _BreathStepState();
}

class _BreathStepState extends State<BreathStep> {
  @override
  Widget build(BuildContext context) {
    return QuestionView(
      padding: EdgeInsets.only(bottom: 50),
      questions: [
        Question(
          title: Text('Are you experiencing shortness of breath?'),
          subtitle: Text('Do you feel like you can\'t get enough air?'),
          input: SimpleSlider(
            value: 1,
            labels: [
              Label(
                child: FaIcon(
                  FontAwesomeIcons.solidSmile,
                  color: Colors.white,
                ),
                percent: 0,
              ),
              Label(
                child: FaIcon(
                  FontAwesomeIcons.solidFrown,
                  color: Colors.white,
                ),
                percent: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
