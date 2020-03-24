import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/questions/question_view.dart';
import 'package:covidnearme/src/ui/utils/checkups.dart';
import 'index.dart';

class SubjectiveStep extends StatefulWidget implements CheckupStep {
  bool get isLastStep => false;

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
            child: Text(AppLocalizations.of(context)
                .subjectiveStepQuestionsLoadedError),
          );
        }

        final QuestionsStateLoaded questionState = state;
        return BlocBuilder<CheckupBloc, CheckupState>(
          builder: (context, state) {
            final CheckupStateInProgress checkupState = state;
            return QuestionView(
              questions: questionState.questions,
              onChange: (Question question, dynamic value) =>
                  _updateCheckup(question, value, checkupState),
              isLastStep: widget.isLastStep,
            );
          },
        );
      },
    );
  }
}
