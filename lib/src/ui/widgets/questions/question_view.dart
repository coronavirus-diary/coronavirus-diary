import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';

import 'question_item.dart';
import 'step_finished_button.dart';

typedef QuestionResponseCallback = void Function(
    Question question, dynamic value);

class QuestionView extends StatefulWidget {
  final List<Question> questions;
  final Color color;
  final EdgeInsetsGeometry padding;
  final QuestionResponseCallback onChange;
  final bool isLastStep;

  const QuestionView({
    @required this.questions,
    this.color,
    this.padding,
    this.onChange,
    this.isLastStep,
  });

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  Set<Question> _answered = {};

  List<Widget> _getQuestions() {
    return widget.questions.map((Question question) {
      switch (question.runtimeType) {
        case ScaleQuestion:
          return QuestionItem(
            question: question,
            onChanged: (int value) {
              _answered.add(question);
              return widget.onChange?.call(question, value);
            },
          );
        case TextFieldQuestion:
          return QuestionItem(
            question: question,
            onChanged: (String value) {
              _answered.add(question);
              return widget.onChange?.call(question, value);
            },
          );
          break;
        case TemperatureQuestion:
          return QuestionItem(
            question: question,
            onChanged: (double value) {
              _answered.add(question);
              return widget.onChange?.call(question, value);
            },
          );
          break;
      }
      return Container();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      color: widget.color ?? Theme.of(context).colorScheme.surface,
      child: ScrollableBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ..._getQuestions(),
            StepFinishedButton(validated: true),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
