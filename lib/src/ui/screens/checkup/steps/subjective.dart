import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/questions/questions.dart';
import 'package:coronavirus_diary/src/ui/widgets/questions/question_view.dart';
import 'index.dart';

class SubjectiveStep extends StatefulWidget implements CheckupStep {
  @override
  _SubjectiveStepState createState() => _SubjectiveStepState();
}

class _SubjectiveStepState extends State<SubjectiveStep> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (context, state) {
        if (state.runtimeType != QuestionsStateLoaded) {
          return Container(
            child: Text('Questions could not be loaded.'),
          );
        }

        final QuestionsStateLoaded convertedState = state;
        return QuestionView(
          padding: EdgeInsets.only(bottom: 50),
          questions: convertedState.questions,
        );
      },
    );
  }
}
