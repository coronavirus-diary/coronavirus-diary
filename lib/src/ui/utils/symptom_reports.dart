import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';

void updateSymptomReport({
  @required SymptomReportStateInProgress symptomReportState,
  @required SymptomReport Function(SymptomReport) updateFunction,
  @required BuildContext context,
}) {
  SymptomReport symptomReport = symptomReportState.symptomReport;
  SymptomReport updatedSymptomReport = updateFunction(symptomReport);
  context
      .bloc<SymptomReportBloc>()
      .add(UpdateSymptomReport(updatedSymptomReport: updatedSymptomReport));
}
