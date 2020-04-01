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
  Map<Question, dynamic> _answered = <Question, dynamic>{};

  List<Widget> _getQuestions() {
    return widget.questions.expand((Question question) sync* {
      void onChanged(Question question, dynamic value) {
        setState(() {
          _answered[question] = value;
        });
        return widget.onChange?.call(question, value);
      }

      switch (question.runtimeType) {
        case ScaleQuestion:
          yield QuestionItem<int>(
            key: ValueKey<Question>(question),
            question: question,
            onChanged: (int value) => onChanged(question, value),
          );
          break;
        case TextFieldQuestion:
          yield QuestionItem<String>(
            key: ValueKey<Question>(question),
            question: question,
            onChanged: (String value) => onChanged(question, value),
          );
          break;
        case TemperatureQuestion:
          yield QuestionItem<double>(
            key: ValueKey<Question>(question),
            question: question,
            onChanged: (double value) => onChanged(question, value),
          );
          break;
        case CompositeQuestion:
          CompositeQuestion composite = question;
          yield QuestionItem<dynamic>(
            key: ValueKey<Question>(composite.children.first),
            question: composite.children.first,
            onChanged: (dynamic value) =>
                onChanged(composite.children.first, value),
          );
          bool endReached = false;
          for (int i = 1; i < composite.children.length; ++i) {
            final Question child = composite.children[i];
            if (!endReached &&
                _answered[composite.children[i - 1]] ==
                    composite.answers[i - 1]) {
              yield QuestionItem<dynamic>(
                key: ValueKey<Question>(child),
                question: child,
                onChanged: (dynamic value) => onChanged(child, value),
              );
            } else {
              endReached = true;
              // Remove any answers for questions that no longer apply.
              if (_answered.remove(child) != null) {
                onChanged(child, null);
              }
            }
          }
          break;
      }
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
