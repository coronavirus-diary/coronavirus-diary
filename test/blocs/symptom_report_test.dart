import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/data/repositories/symptom_reports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pedantic/pedantic.dart';

void main() {
  test(
      'SymptomReportBloc only responds to StartSymptomReport, UpdateSymptomReport, and '
      'CompleteSymptomReport', () async {
    final bloc = SymptomReportBloc(
      symptomReportsRepository: FakeSymptomReportsRepository(),
      preferencesState: FakePreferencesState(),
    );
    bloc.add(NotSymptomReportEvent());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          const SymptomReportStateNotCreated(),
          emitsDone,
        ],
      ),
    );
  });

  test(
      'SymptomReportBloc does not update if CompleteSymptomReport is recieved in a state '
      'other than SymptomReportStateInProgress', () async {
    final bloc = SymptomReportBloc(
      symptomReportsRepository: FakeSymptomReportsRepository(),
      preferencesState: FakePreferencesState(),
    );
    bloc.add(CompleteSymptomReport());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          const SymptomReportStateNotCreated(),
          emitsDone,
        ],
      ),
    );
  });

  test(
      'SymptomReportBloc does not update if UpdateSymptomReport is recieved in a state '
      'other than SymptomReportStateInProgress', () async {
    final bloc = SymptomReportBloc(
      symptomReportsRepository: FakeSymptomReportsRepository(),
      preferencesState: FakePreferencesState(),
    );
    bloc.add(UpdateSymptomReport());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          const SymptomReportStateNotCreated(),
          emitsDone,
        ],
      ),
    );
  });

  test(
      'SymptomReportBloc starts symptomReport process when it receives a StartSymptomReport event',
      () async {
    final bloc = SymptomReportBloc(
      symptomReportsRepository: FakeSymptomReportsRepository(),
      preferencesState: FakePreferencesState(),
    );
    bloc.add(StartSymptomReport());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          const SymptomReportStateNotCreated(),
          const SymptomReportStateCreating(),
          isA<SymptomReportStateInProgress>()
            ..having((s) => s.symptomReport, 'symptomReport', isNotNull),
          emitsDone,
        ],
      ),
    );
  });

  test(
      'SymptomReportBloc can update (no-op) symptomReport when it receives a StartSymptomReport, '
      'UpdateSymptomReport events', () async {
    final bloc = SymptomReportBloc(
      symptomReportsRepository: FakeSymptomReportsRepository(),
      preferencesState: FakePreferencesState(),
    );
    bloc.add(StartSymptomReport());
    bloc.add(UpdateSymptomReport());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          const SymptomReportStateNotCreated(),
          const SymptomReportStateCreating(),
          isA<SymptomReportStateInProgress>()
            ..having((s) => s.symptomReport, 'symptomReport', isNotNull),
          isA<SymptomReportStateInProgress>()
            ..having((s) => s.symptomReport, 'symptomReport', isNotNull),
          emitsDone,
        ],
      ),
    );
  });

  test(
      'SymptomReportBloc can complete symptomReport after receiving StartSymptomReport, '
      'CompleteSymptomReport events', () async {
    final bloc = SymptomReportBloc(
      symptomReportsRepository: FakeSymptomReportsRepository(),
      preferencesState: FakePreferencesState(),
    );
    bloc.add(StartSymptomReport());
    bloc.add(CompleteSymptomReport());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          const SymptomReportStateNotCreated(),
          const SymptomReportStateCreating(),
          isA<SymptomReportStateInProgress>()
            ..having((s) => s.symptomReport, 'symptomReport', isNotNull),
          const SymptomReportStateCompleting(),
          const SymptomReportStateCompleted(),
          emitsDone,
        ],
      ),
    );
  });
}

class NotSymptomReportEvent extends SymptomReportEvent {}

class FakeSymptomReportsRepository implements SymptomReportsRepository {
  Future<void> completeSymptomReport(String id) async {}

  @override
  Future<SymptomReport> createSymptomReport(SymptomReport report) async {
    return SymptomReport();
  }

  Future<SymptomReport> updateSymptomReport(SymptomReport updatedReport) async {
    return SymptomReport();
  }
}

class FakePreferencesState implements PreferencesState {
  @override
  Preferences get preferences => Preferences(userId: '1');
}
