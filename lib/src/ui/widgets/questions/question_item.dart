import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/data/models/questions.dart';
import 'inputs/index.dart';

class QuestionItem extends StatefulWidget {
  final Question question;
  final Function(dynamic value) onChange;

  const QuestionItem({this.question, this.onChange});

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  List<FlutterSliderHatchMarkLabel> _getHatchMarkLabels(
      SliderQuestion question) {
    if (question.labels == null) return [];

    List<FlutterSliderHatchMarkLabel> labels = [];
    question.labels.forEach((String key, String value) {
      labels.add(FlutterSliderHatchMarkLabel(
        label: Text(value),
        percent: (double.parse(key) / question.max) * 100,
      ));
    });
    return labels;
  }

  Widget _getInput() {
    switch (widget.question.runtimeType) {
      case SliderQuestion:
        final SliderQuestion question = widget.question;
        return SimpleSlider(
          value: question.initialValue,
          min: question.min,
          max: question.max,
          labels: _getHatchMarkLabels(question),
          onChange: widget.onChange,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          Text(
            widget.question.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
          ),
          if (widget.question.subtitle != null)
            Padding(
              padding: EdgeInsets.only(top: 20),
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
