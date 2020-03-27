import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/radio_button_scale.dart';

class QuestionItem extends StatefulWidget {
  final Question question;
  final ValueChanged<int> onChanged;

  const QuestionItem({this.question, this.onChanged});

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  int currentValue;

  @override
  void initState() {
    super.initState();
    if (widget.question is ScaleQuestion) {
      currentValue = (widget.question as ScaleQuestion).initialValue;
    }
  }

  void _handleRadioChange(int value) {
    setState(() {
      currentValue = value;
      widget.onChanged?.call(value);
    });
  }

  Widget _getInput() {
    switch (widget.question.runtimeType) {
      case ScaleQuestion:
        final ScaleQuestion sliderQuestion = widget.question;
        return RadioButtonScale(
          labels: sliderQuestion.labels,
          value: currentValue,
          semanticLabels: sliderQuestion.semanticLabels,
          onChanged: widget.onChanged == null ? null : _handleRadioChange,
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
