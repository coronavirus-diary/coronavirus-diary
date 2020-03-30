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
  final SymptomReport updatedSystemReport;

  const UpdateSymptomReport({this.updatedSystemReport});

  @override
  List<Object> get props => [updatedSystemReport];
}

class CompleteSymptomReport extends SymptomReportEvent {
  const CompleteSymptomReport();
}
