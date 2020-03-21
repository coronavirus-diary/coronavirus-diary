import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/blocs/questions/questions.dart';
import 'package:coronavirus_diary/src/ui/router.dart';
import 'package:coronavirus_diary/src/ui/widgets/questions/question_view.dart';
import 'package:coronavirus_diary/src/ui/utils/checkups.dart';
import 'index.dart';

class SubjectiveStep extends StatefulWidget implements CheckupStep {
  @override
  _SubjectiveStepState createState() => _SubjectiveStepState();
}

class _SubjectiveStepState extends State<SubjectiveStep> {
  void _updateCheckup(
    Question question,
    dynamic value,
    CheckupStateInProgress checkupState,
  ) {
    updateCheckup(
      checkupState: checkupState,
      context: context,
      updateFunction: (Checkup checkup) {
        final SubjectiveQuestionResponse newResponse =
            SubjectiveQuestionResponse(
          id: question.id,
          response: value,
        );

        // Check if we have an existing response
        final int existingResponseIndex =
            checkup.subjectiveResponses.indexWhere(
          (SubjectiveQuestionResponse response) =>
              response.id == newResponse.id,
        );

        // Replace or add the new response
        if (existingResponseIndex != -1) {
          checkup.subjectiveResponses[existingResponseIndex] = newResponse;
        } else {
          checkup.subjectiveResponses.add(newResponse);
        }

        return checkup;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (context, state) {
        if (state is! QuestionsStateLoaded) {
          return Container(
            child: Text('Questions could not be loaded.'),
          );
        }

        final QuestionsStateLoaded questionState = state;
        return BlocBuilder<CheckupBloc, CheckupState>(
          builder: (context, state) {
            if (state is! CheckupStateInProgress) {
              // We should never hit this, but if we do, let's
              // navigate back to the beginning to make sure
              // the checkup is created.
              Navigator.pushNamed(context, CheckupScreen.routeName);
              return Container();
            }

            final CheckupStateInProgress checkupState = state;
            return QuestionView(
              padding: EdgeInsets.only(bottom: 80),
              questions: questionState.questions,
              onChange: (Question question, dynamic value) =>
                  _updateCheckup(question, value, checkupState),
            );
          },
        );
      },
    );
  }
}
