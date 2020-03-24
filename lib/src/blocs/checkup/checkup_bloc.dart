import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/data/models/checkups.dart';
import 'package:covidnearme/src/data/repositories/checkups.dart';
import 'package:meta/meta.dart';
import 'checkup.dart';

export 'package:covidnearme/src/data/models/assessments.dart';
export 'package:covidnearme/src/data/models/checkups.dart';

class CheckupBloc extends Bloc<CheckupEvent, CheckupState> {
  final PreferencesState preferencesState;
  final CheckupsRepository checkupsRepository;

  CheckupBloc({
    @required this.preferencesState,
    @required this.checkupsRepository,
  });

  @override
  CheckupState get initialState => const CheckupStateNotCreated();

  @override
  Stream<CheckupState> mapEventToState(CheckupEvent event) async* {
    switch (event.runtimeType) {
      case StartCheckup:
        yield* _mapStartCheckupToState(event);
        break;
      case UpdateCheckup:
        yield* _mapUpdateCheckupToState(event);
        break;
      case CompleteCheckup:
        yield* _mapCompleteCheckupToState(event);
        break;
    }
  }

  Stream<CheckupState> _mapStartCheckupToState(StartCheckup event) async* {
    yield const CheckupStateCreating();

    // Create checkup using API
    final Checkup newCheckup = await checkupsRepository.createCheckup(Checkup(
      userId: preferencesState.preferences.userId,
    ));

    yield CheckupStateInProgress(checkup: newCheckup);
  }

  Stream<CheckupState> _mapUpdateCheckupToState(UpdateCheckup event) async* {
    // Exit if checkup is not in progress
    if (state is! CheckupStateInProgress) return;

    // Set state to updated checkup
    yield CheckupStateInProgress(
      checkup: event.updatedCheckup,
    );
  }

  Stream<CheckupState> _mapCompleteCheckupToState(
      CompleteCheckup event) async* {
    // Exit if checkup is not in progress
    if (state is! CheckupStateInProgress) return;

    // Notify app that we are waiting to submit data
    yield const CheckupStateCompleting();

    // Retrieve current checkup
    final CheckupStateInProgress currentState = state;
    final Checkup currentCheckup = currentState.checkup;

    // TODO: remove this when API is integrated
    print(currentCheckup.toJson().toString());

    // Make sure checkup is up to date on server
    final Checkup checkup =
        await checkupsRepository.updateCheckup(currentCheckup);

    // Complete checkup
    final Assessment assessment =
        await checkupsRepository.completeCheckup(checkup.id);

    // TODO: remove this when API is integrated
    print(assessment.toJson().toString());

    // Complete checkup using API
    yield CheckupStateCompleted(assessment: assessment);
  }
}
