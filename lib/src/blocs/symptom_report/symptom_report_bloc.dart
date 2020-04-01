import 'dart:async';

import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/data/repositories/symptom_reports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:meta/meta.dart';
import 'symptom_report.dart';

class SymptomReportBloc extends Bloc<SymptomReportEvent, SymptomReportState> {
  final PreferencesState preferencesState;
  final SymptomReportsRepository symptomReportsRepository;

  SymptomReportBloc({
    @required this.preferencesState,
    @required this.symptomReportsRepository,
  });

  @override
  SymptomReportState get initialState => const SymptomReportStateNotCreated();

  @override
  Stream<SymptomReportState> mapEventToState(SymptomReportEvent event) async* {
    switch (event.runtimeType) {
      case StartSymptomReport:
        yield* _mapStartCheckupToState(event);
        break;
      case UpdateSymptomReport:
        yield* _mapUpdateCheckupToState(event);
        break;
      case CompleteSymptomReport:
        yield* _mapCompleteCheckupToState(event);
        break;
    }
  }

  Stream<SymptomReportState> _mapStartCheckupToState(
      StartSymptomReport event) async* {
    yield const SymptomReportStateCreating();

    // Create checkup using API
    final SymptomReport newReport =
        await symptomReportsRepository.createSymptomReport(
      SymptomReport(
        userId: preferencesState.preferences.userId,
      ),
    );

    yield SymptomReportStateInProgress(symptomReport: newReport);
  }

  Stream<SymptomReportState> _mapUpdateCheckupToState(
      UpdateSymptomReport event) async* {
    // Exit if checkup is not in progress
    if (state is! SymptomReportStateInProgress) return;

    // Set state to updated checkup
    yield SymptomReportStateInProgress(
      symptomReport: event.updatedSymptomReport,
    );
  }

  Stream<SymptomReportState> _mapCompleteCheckupToState(
      CompleteSymptomReport event) async* {
    // Exit if checkup is not in progress
    if (state is! SymptomReportStateInProgress) return;

    // Notify app that we are waiting to submit data
    yield const SymptomReportStateCompleting();

    // Retrieve current checkup
    final SymptomReportStateInProgress currentState = state;
    final SymptomReport currentReport = currentState.symptomReport;

    // TODO: remove this when API is integrated
    print(currentReport.toJson().toString());

    // Make sure checkup is up to date on server
    final SymptomReport report =
        await symptomReportsRepository.updateSymptomReport(currentReport);

    // Complete checkup
    await symptomReportsRepository.completeSymptomReport(report.userId);

    // Complete checkup using API
    yield const SymptomReportStateCompleted();
  }
}
