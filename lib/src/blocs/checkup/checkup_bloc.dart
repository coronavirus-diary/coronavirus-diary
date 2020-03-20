import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/data/models/checkups.dart';
import 'checkup.dart';

export 'package:coronavirus_diary/src/data/models/checkups.dart';

class CheckupBloc extends Bloc<CheckupEvent, CheckupState> {
  final PreferencesState preferencesState;

  CheckupBloc({this.preferencesState});

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
    // Create checkup using API
    yield CheckupStateCreating();
    yield CheckupStateInProgress(
      checkup: Checkup(
        userId: preferencesState.preferences.userId,
      ),
    );
  }

  Stream<CheckupState> _mapUpdateLocalCheckupToState(
      UpdateLocalCheckup event) async* {
    // Don't send to API yet
    print(event.updatedCheckup);
    yield CheckupStateInProgress(
      checkup: event.updatedCheckup,
    );
  }

  Stream<CheckupState> _mapUpdateRemoteCheckupToState(
      UpdateRemoteCheckup event) async* {
    // Patch checkup using API
    print('Saving checkup to server');
  }

  Stream<CheckupState> _mapCompleteCheckupToState(
      CompleteCheckup event) async* {
    // Patch checkup using API
    yield CheckupStateCompleted();
  }
}
