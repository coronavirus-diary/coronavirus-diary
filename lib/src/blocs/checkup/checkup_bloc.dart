import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/data/models/checkups.dart';
import 'package:coronavirus_diary/src/data/repositories/checkups.dart';
import 'checkup.dart';

export 'package:coronavirus_diary/src/data/models/assessments.dart';
export 'package:coronavirus_diary/src/data/models/checkups.dart';

class CheckupBloc extends Bloc<CheckupEvent, CheckupState> {
  final PreferencesState preferencesState;
  final CheckupsRepository checkupsRepository;

  CheckupBloc({
    this.preferencesState,
    this.checkupsRepository,
  });

  @override
  CheckupState get initialState => CheckupStateNotCreated();

  @override
  Stream<CheckupState> mapEventToState(CheckupEvent event) async* {
    switch (event.runtimeType) {
      case StartCheckup:
        yield* _mapStartCheckupToState(event);
        break;
      case UpdateLocalCheckup:
        yield* _mapUpdateLocalCheckupToState(event);
        break;
      case UpdateRemoteCheckup:
        yield* _mapUpdateRemoteCheckupToState(event);
        break;
      case CompleteCheckup:
        yield* _mapCompleteCheckupToState(event);
        break;
    }
  }

  Stream<CheckupState> _mapStartCheckupToState(StartCheckup event) async* {
    yield CheckupStateCreating();

    // Create checkup using API
    final Checkup newCheckup = await checkupsRepository.createCheckup(Checkup(
      userId: preferencesState.preferences.userId,
    ));

    yield CheckupStateInProgress(checkup: newCheckup);
  }

  Stream<CheckupState> _mapUpdateLocalCheckupToState(
      UpdateLocalCheckup event) async* {
    // Exit if checkup is not in progress
    if (state is! CheckupStateInProgress) return;

    // Don't send to API yet
    // TODO: remove this
    print(event.updatedCheckup);
    yield CheckupStateInProgress(
      checkup: event.updatedCheckup,
    );
  }

  Stream<CheckupState> _mapUpdateRemoteCheckupToState(
      UpdateRemoteCheckup event) async* {
    // Exit if checkup is not in progress
    if (state is! CheckupStateInProgress) return;

    // Retrieve current checkup
    final CheckupStateInProgress currentState = state;
    final Checkup currentCheckup = currentState.checkup;

    // Patch checkup using API and return it (to handle server-side updates)
    final Checkup checkup =
        await checkupsRepository.updateCheckup(currentCheckup);
    yield CheckupStateInProgress(checkup: checkup);
  }

  Stream<CheckupState> _mapCompleteCheckupToState(
      CompleteCheckup event) async* {
    // Exit if checkup is not in progress
    if (state is! CheckupStateInProgress) return;

    // Notify app that we are waiting to submit data
    yield CheckupStateCompleting();

    // Retrieve current checkup
    final CheckupStateInProgress currentState = state;
    final Checkup currentCheckup = currentState.checkup;

    // TODO: remove this
    print(currentCheckup.toJson().toString());

    // Make sure checkup is up to date on server
    final Checkup checkup =
        await checkupsRepository.updateCheckup(currentCheckup);

    // Complete checkup
    final Assessment assessment =
        await checkupsRepository.completeCheckup(checkup.id);

    // TODO: remove this
    print(assessment.toJson().toString());

    // Complete checkup using API
    yield CheckupStateCompleted(assessment: assessment);
  }
}
