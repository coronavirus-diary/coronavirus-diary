import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/data/repositories/symptom_reports.dart';
import 'package:covidnearme/src/utils/env.dart' show appEnv;
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
        yield* _mapStartSymptomReportToState(event);
        break;
      case UpdateSymptomReport:
        yield* _mapUpdateSymptomReportToState(event);
        break;
      case CompleteSymptomReport:
        yield* _mapCompleteSymptomReportToState(event);
        break;
      case ClearSymptomReport:
        yield* _mapClearSymptomReportToState(event);
        break;
    }
  }

  Stream<SymptomReportState> _mapStartSymptomReportToState(
      StartSymptomReport event) async* {
    yield const SymptomReportStateCreating();

    // Create symptom report
    final SymptomReport newReport = SymptomReport(
      userId: preferencesState.preferences.userId,
      isFake: appEnv['ENVIRONMENT'] != 'production',
    );

    yield SymptomReportStateInProgress(symptomReport: newReport);
  }

  Stream<SymptomReportState> _mapUpdateSymptomReportToState(
      UpdateSymptomReport event) async* {
    // Exit if symptom report is not in progress
    if (state is! SymptomReportStateInProgress) return;

    // Set state to updated symptom report
    yield SymptomReportStateInProgress(
      symptomReport: event.updatedSymptomReport,
    );
  }

  Stream<SymptomReportState> _mapCompleteSymptomReportToState(
      CompleteSymptomReport event) async* {
    // Exit if symptom report is not in progress
    if (state is! SymptomReportStateInProgress) return;

    // Notify app that we are waiting to submit data
    yield const SymptomReportStateCompleting();

    // Retrieve current symptom report
    final SymptomReportStateInProgress currentState = state;
    final SymptomReport currentReport = currentState.symptomReport;

    // Send symptom report to server
    await symptomReportsRepository.createSymptomReport(currentReport);

    // Notify app of completion
    yield const SymptomReportStateCompleted();
  }

  Stream<SymptomReportState> _mapClearSymptomReportToState(
      ClearSymptomReport event) async* {
    assert(
      state is SymptomReportStateCompleted,
      'Must be in completed state to clear symptom report, not ${state.runtimeType}.',
    );

    yield const SymptomReportStateNotCreated();
  }
}
