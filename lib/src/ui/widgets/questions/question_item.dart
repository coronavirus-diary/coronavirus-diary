import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/questions.dart';
import 'inputs/index.dart';

class QuestionItem extends StatefulWidget {
  final Question question;
  final Function(dynamic value) onChange;

  const QuestionItem({this.question, this.onChange});

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  Widget _getInput() {
    switch (widget.question.runtimeType) {
      case SliderQuestion:
        final SliderQuestion question = widget.question;
        return SimpleSlider(
          value: question.initialValue,
          min: question.min,
          max: question.max,
          labels: question.labels,
          onChange: widget.onChange,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(
            widget.question.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
          ),
          if (widget.question.subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                widget.question.subtitle,
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
