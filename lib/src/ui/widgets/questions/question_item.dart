import 'package:covidnearme/src/ui/widgets/questions/inputs/entry_field.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/temperature_field.dart';
import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/radio_button_scale.dart';

typedef QuestionItemChanged<T> = void Function(T value);

class QuestionItem<T> extends StatefulWidget {
  final Question question;
  final QuestionItemChanged<T> onChanged;

  const QuestionItem({
    Key key,
    @required this.question,
    @required this.onChanged,
  })  : assert(onChanged != null),
        super(key: key);

  @override
  _QuestionItemState<T> createState() => _QuestionItemState<T>();
}

class _QuestionItemState<T> extends State<QuestionItem<T>> {
  dynamic currentValue;

  @override
  void initState() {
    super.initState();
    if (widget.question is ScaleQuestion) {
      currentValue = (widget.question as ScaleQuestion).initialValue;
    }
  }

  void _handleChange(dynamic value) {
    setState(() {
      currentValue = value;
      widget.onChanged?.call(value as T);
    });
  }

  Widget _getInput() {
    switch (widget.question.runtimeType) {
      case ScaleQuestion:
        final ScaleQuestion scaleQuestion = widget.question;
        return RadioButtonScale(
            labels: scaleQuestion.labels,
            axis: scaleQuestion.vertical ? Axis.vertical : Axis.horizontal,
            value: scaleQuestion.values.indexOf(currentValue),
            semanticLabels: scaleQuestion.semanticLabels,
            onChanged: (int value) {
              _handleChange(value != null ? scaleQuestion.values[value] : null);
            });
        break;
      case TemperatureQuestion:
        final TemperatureQuestion temperatureQuestion = widget.question;
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TemperatureField(
            initialValue: temperatureQuestion.initialValue,
            onChanged: _handleChange,
          ),
        );
        break;
      case TextFieldQuestion:
        final TextFieldQuestion textFieldQuestion = widget.question;
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: EntryField(
            initialValue: textFieldQuestion.initialValue,
            onChanged: _handleChange,
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
