import 'package:flutter/material.dart';

class Question {
  final Widget title;
  final Widget subtitle;
  final Widget input;

  const Question({
    @required this.title,
    this.subtitle,
    this.input,
  });
}

class QuestionView extends StatefulWidget {
  final List<Question> questions;
  final Color color;
  final EdgeInsetsGeometry padding;

  const QuestionView({
    @required this.questions,
    this.color,
    this.padding,
  });

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  List<Widget> _getQuestions() {
    return widget.questions.map((Question question) {
      return Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            DefaultTextStyle(
              child: question.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title.copyWith(
                    color: Colors.white,
                  ),
            ),
            if (question.subtitle != null)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: DefaultTextStyle(
                  child: question.subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            if (question.input != null)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: question.input,
              ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      color: widget.color ?? Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _getQuestions(),
      ),
    );
  }
}
