import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/utils/symptom_reports.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/temperature_field.dart';
import 'package:covidnearme/src/ui/widgets/questions/step_finished_button.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';

import 'index.dart';

class TemperatureStep extends StatefulWidget implements SymptomReportStep {
  bool get isLastStep => true;

  @override
  _TemperatureStepState createState() => _TemperatureStepState();
}

class _TemperatureStepState extends State<TemperatureStep> {
  void _updateTemperature(
    double value,
    SymptomReportStateInProgress symptomReportState,
  ) {
    updateSymptomReport(
      symptomReportState: symptomReportState,
      context: context,
      updateFunction: (SymptomReport symptomReport) {
        final QuestionResponse newResponse = QuestionResponse(
          questionId: 'temperature',
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
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<SymptomReportBloc, SymptomReportState>(
      builder: (context, state) {
        final SymptomReportStateInProgress symptomReportState = state;
        final QuestionResponse existingResponse =
            symptomReportState.symptomReport.questionResponses.firstWhere(
          (QuestionResponse response) => response.questionId == 'temperature',
          orElse: () => null,
        );
        return ScrollableBody(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Text(
                      localizations.temperatureStepTitle,
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 26,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 120),
                    child: TemperatureField(
                      initialValue: existingResponse != null
                          ? existingResponse.response
                          : null,
                      onChanged: (double value) =>
                          _updateTemperature(value, symptomReportState),
                      label: localizations.temperatureStepTemperatureLabel,
                      minHeight: 0.0,
                      autofocus: true,
                    ),
                  ),
                  StepFinishedButton(
                    isLastStep: true,
                    validated: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
