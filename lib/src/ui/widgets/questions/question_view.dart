import 'package:covidnearme/src/data/repositories/symptom_reports.dart';
import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';

import 'question_item.dart';
import 'step_finished_button.dart';

typedef QuestionResponseCallback = void Function(
    Question question, dynamic value);

class QuestionView extends StatefulWidget {
  final List<Question> questions;
  final List<QuestionResponse> responses;
  final Color color;
  final EdgeInsetsGeometry padding;
  final QuestionResponseCallback onChange;
  final bool isLastStep;

  const QuestionView({
    @required this.questions,
    this.responses,
    this.color,
    this.padding,
    this.onChange,
    this.isLastStep,
  });

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  Map<String, dynamic> _answered = <String, dynamic>{};

  @override
  void initState() {
    final idToResponse = <String, QuestionResponse>{
      if (widget.responses != null)
        for (final response in widget.responses)
          response.questionIdentifier: response,
    };
    for (final question in widget.questions) {
      if (idToResponse.containsKey(question.id)) {
        _answered[question.id] = idToResponse[question.id].response;
      }
      if (question is CompositeQuestion) {
        for (int i = 1; i < question.children.length; ++i) {
          final child = question.children[i];
          if (idToResponse.containsKey(child.id)) {
            _answered[child.id] = idToResponse[child.id].response;
          }
        }
      }
    }
    super.initState();
  }

  List<Widget> _getQuestions() {
    return widget.questions.expand((Question question) sync* {
      void onChanged(Question question, dynamic value) {
        setState(() {
          _answered[question.id] = value;
        });
        return widget.onChange?.call(question, value);
      }

      bool matchingCompositeAnswer(CompositeQuestion composite, int index) {
        final child = composite.children[index];
        final answer = composite.answers[index];
        return _answered[child.id] == answer;
      }

      final prepopulatedResponse = _answered[question.id].toString();
      switch (question.runtimeType) {
        case ScaleQuestion:
          yield QuestionItem<String>(
            key: ValueKey<Question>(question),
            initialValue: prepopulatedResponse,
            question: question,
            onChanged: (String value) => onChanged(question, value),
          );
          break;
        case TextFieldQuestion:
          yield QuestionItem<String>(
            key: ValueKey<Question>(question),
            initialValue: prepopulatedResponse,
            question: question,
            onChanged: (String value) => onChanged(question, value),
          );
          break;
        case TemperatureQuestion:
          yield QuestionItem<double>(
            key: ValueKey<Question>(question),
            initialValue: double.tryParse(prepopulatedResponse ?? ''),
            question: question,
            onChanged: (double value) => onChanged(question, value),
          );
          break;
        case CompositeQuestion:
          CompositeQuestion composite = question;
          yield QuestionItem<dynamic>(
            key: ValueKey<Question>(composite.children.first),
            initialValue: prepopulatedResponse,
            question: composite.children.first,
            onChanged: (dynamic value) =>
                onChanged(composite.children.first, value),
          );
          bool endReached = false;
          for (int i = 1; i < composite.children.length; ++i) {
            final Question child = composite.children[i];
            if (!endReached && matchingCompositeAnswer(composite, i - 1)) {
              yield QuestionItem<dynamic>(
                key: ValueKey<Question>(child),
                initialValue: _answered[child.id],
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
            StepFinishedButton(
              validated: true,
              isLastStep: widget.isLastStep,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
