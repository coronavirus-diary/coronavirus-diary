import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void updateSystemReport({
  @required SymptomReportStateInProgress symptomReportState,
  @required SymptomReport Function(SymptomReport) updateFunction,
  @required BuildContext context,
}) {
  SymptomReport systemReport = symptomReportState.symptomReport;
  SymptomReport updatedSystemReport = updateFunction(systemReport);
  context
      .bloc<SymptomReportBloc>()
      .add(UpdateSymptomReport(updatedSystemReport: updatedSystemReport));
}
