import 'package:covidnearme/src/data/models/symptom_report.dart';

abstract class SymptomReportState {
  const SymptomReportState();
}

class SymptomReportStateNotCreated extends SymptomReportState {
  const SymptomReportStateNotCreated();
}

class SymptomReportStateCreating extends SymptomReportState {
  const SymptomReportStateCreating();
}

class SymptomReportStateInProgress extends SymptomReportState {
  final SymptomReport symptomReport;

  const SymptomReportStateInProgress({this.symptomReport});

  @override
  String toString() =>
      'SymptomReportStateInProgress { symptomReport: $symptomReport }';
}

class SymptomReportStateCompleting extends SymptomReportState {
  const SymptomReportStateCompleting();
}

class SymptomReportStateCompleted extends SymptomReportState {
  const SymptomReportStateCompleted();
}
