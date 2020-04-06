import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:equatable/equatable.dart';

abstract class SymptomReportEvent extends Equatable {
  const SymptomReportEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class StartSymptomReport extends SymptomReportEvent {
  const StartSymptomReport();
}

class UpdateSymptomReport extends SymptomReportEvent {
  final SymptomReport updatedSymptomReport;

  const UpdateSymptomReport({this.updatedSymptomReport});

  @override
  List<Object> get props => [updatedSymptomReport];
}

class CompleteSymptomReport extends SymptomReportEvent {
  const CompleteSymptomReport();
}

class ClearSymptomReport extends SymptomReportEvent {
  const ClearSymptomReport();
}
