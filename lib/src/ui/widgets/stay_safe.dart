import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/ui/widgets/tutorial_step.dart';

class StaySafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Stay Safe",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          TutorialStep(
            text: 'Wash your hands.',
            number: 1,
            leadingBackgroundColor: Colors.white.withOpacity(0.2),
          ),
          TutorialStep(
            text: 'Limit contact with other people.',
            number: 2,
            leadingBackgroundColor: Colors.white.withOpacity(0.2),
          ),
          TutorialStep(
            text: 'Check back in if you continue to experience symptoms.',
            number: 3,
            leadingBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
