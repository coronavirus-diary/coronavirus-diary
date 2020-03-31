import 'package:covidnearme/src/ui/widgets/questions/inputs/entry_field.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/temperature_field.dart';
import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/radio_button_scale.dart';

class QuestionItem extends StatefulWidget {
  final Question question;
  final Function onChanged;

  const QuestionItem({
    @required this.question,
    @required this.onChanged,
  }) : assert(onChanged != null);

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  dynamic currentValue;

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

  void _handleTextChange(String value) {
    setState(() {
      currentValue = value;
      widget.onChanged?.call(value as dynamic);
    });
  }

  void _handleTemperatureChange(double value) {
    setState(() {
      currentValue = value;
      widget.onChanged?.call(value as dynamic);
    });
  }

  Widget _getInput() {
    switch (widget.question.runtimeType) {
      case ScaleQuestion:
        final ScaleQuestion scaleQuestion = widget.question;
        return RadioButtonScale(
          labels: scaleQuestion.labels,
          axis: scaleQuestion.vertical ? Axis.vertical : Axis.horizontal,
          value: currentValue as int,
          semanticLabels: scaleQuestion.semanticLabels,
          onChanged: _handleRadioChange,
        );
        break;
      case TemperatureQuestion:
        final TemperatureQuestion temperatureQuestion = widget.question;
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TemperatureField(
            initialValue: temperatureQuestion.initialValue,
            onChanged: _handleTemperatureChange,
          ),
        );
        break;
      case TextFieldQuestion:
        final TextFieldQuestion textFieldQuestion = widget.question;
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: EntryField(
            initialValue: textFieldQuestion.initialValue,
            onChanged: _handleTextChange,
          ),
        );
        break;
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
