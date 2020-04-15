import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/questions/question_view.dart';
import 'package:covidnearme/src/ui/utils/symptom_reports.dart';
import 'package:provider/provider.dart';
import 'index.dart';

class QuestionsStep extends StatefulWidget implements SymptomReportStep {
  bool get isLastStep => true;
  bool get showProgress => true;

  const QuestionsStep();

  @override
  _QuestionsStepState createState() => _QuestionsStepState();
}

class _QuestionsStepState extends State<QuestionsStep> {
  void _updateSymptomReport(
    Question question,
    dynamic value,
    SymptomReportStateInProgress symptomReportState,
  ) {
    updateSymptomReport(
      symptomReportState: symptomReportState,
      context: context,
      updateFunction: (SymptomReport symptomReport) {
        final QuestionResponse newResponse = QuestionResponse(
          questionIdentifier: question.id,
          response: value.toString(),
        );

        // Check if we have an existing response
        final int existingResponseIndex =
            symptomReport.questionResponses.indexWhere(
          (QuestionResponse response) =>
              response.questionIdentifier == newResponse.questionIdentifier,
        );

        // Replace or add the new response
        if (existingResponseIndex != -1) {
          if (value == null) {
            symptomReport.questionResponses.removeAt(existingResponseIndex);
          } else {
            symptomReport.questionResponses[existingResponseIndex] =
                newResponse;
          }
        } else {
          if (value != null) {
            symptomReport.questionResponses.add(newResponse);
          }
        }

        return symptomReport;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      key: ValueKey('symptomReportQuestionsStep'),
      builder: (context, state) {
        if (state is! QuestionsStateLoaded) {
          return Container(
            child: Text(
                AppLocalizations.of(context).questionsStepQuestionsLoadedError),
          );
        }

        final QuestionsStateLoaded questionState = state;
        return BlocBuilder<SymptomReportBloc, SymptomReportState>(
          builder: (context, state) {
            final SymptomReportStateInProgress symptomReportState = state;
            return QuestionView(
              questions: questionState.questions,
              responses: Provider.of<SymptomReport>(context)?.questionResponses,
              onChange: (Question question, dynamic value) =>
                  _updateSymptomReport(question, value, symptomReportState),
              isLastStep: widget.isLastStep,
            );
          },
        );
      },
    );
  }
}
