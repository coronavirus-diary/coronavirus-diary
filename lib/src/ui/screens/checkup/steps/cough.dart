import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:coronavirus_diary/src/ui/widgets/question_view.dart';
import 'package:coronavirus_diary/src/ui/widgets/simple_slider.dart';
import 'index.dart';

class CoughStep extends StatefulWidget implements CheckupStep {
  @override
  _CoughStepState createState() => _CoughStepState();
}

class _CoughStepState extends State<CoughStep> {
  @override
  Widget build(BuildContext context) {
    return QuestionView(
      questions: [
        Question(
          title: Text('Do you have a cough?'),
          subtitle: Text('How often?'),
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
