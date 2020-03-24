import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/questions.dart';
import 'question_item.dart';
import '../scrollable_body.dart';

class QuestionView extends StatefulWidget {
  final List<Question> questions;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Function(Question question, dynamic value) onChange;

  const QuestionView({
    @required this.questions,
    this.color,
    this.padding,
    this.onChange,
  });

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  List<Widget> _getQuestions() {
    return widget.questions
        .map((Question question) => QuestionItem(
              question: question,
              onChange: (dynamic value) => widget.onChange(question, value),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      color: widget.color ?? Theme.of(context).primaryColor,
      child: ScrollableBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _getQuestions(),
        ),
      ),
    );
  }
}
