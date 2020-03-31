import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/questions/question_view.dart';
import 'package:covidnearme/src/ui/utils/symptom_reports.dart';
import 'index.dart';

class SubjectiveStep extends StatefulWidget implements SymptomReportStep {
  bool get isLastStep => false;

  @override
  _SubjectiveStepState createState() => _SubjectiveStepState();
}

class _SubjectiveStepState extends State<SubjectiveStep> {
  void _updateCheckup(
    Question question,
    dynamic value,
    SymptomReportStateInProgress symptomReportState,
  ) {
    updateSymptomReport(
      symptomReportState: symptomReportState,
      context: context,
      updateFunction: (SymptomReport symptomReport) {
        final QuestionResponse newResponse = QuestionResponse(
          questionId: question.id,
          response: value,
        );

        // Check if we have an existing response
        final int existingResponseIndex =
            symptomReport.questionResponses.indexWhere(
          (QuestionResponse response) =>
              response.questionId == newResponse.questionId,
        );

        // Replace or add the new response
        if (existingResponseIndex != -1) {
          symptomReport.questionResponses[existingResponseIndex] = newResponse;
        } else {
          symptomReport.questionResponses.add(newResponse);
        }

        return symptomReport;
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
        return BlocBuilder<SymptomReportBloc, SymptomReportState>(
          builder: (context, state) {
            final SymptomReportStateInProgress checkupState = state;
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
