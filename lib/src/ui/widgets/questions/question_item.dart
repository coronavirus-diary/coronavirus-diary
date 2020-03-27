import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/radio_button_scale.dart';

class QuestionItem extends StatelessWidget {
  final Question question;
  final ValueChanged<int> onChange;

  const QuestionItem({this.question, this.onChange});

  Widget _getInput() {
    switch (question.runtimeType) {
      case SliderQuestion:
        final SliderQuestion sliderQuestion = question;
        return RadioButtonScale(
          labels: sliderQuestion.labels,
          initialValue: sliderQuestion.initialValue,
          semanticLabels: sliderQuestion.semanticLabels,
          onChanged: onChange,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Text(
            question.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
          ),
          if (question.subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                question.subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),
          _getInput(),
        ],
      ),
    );
  }
}
