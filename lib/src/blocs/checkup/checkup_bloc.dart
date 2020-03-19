import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkup.dart';

class CheckupBloc extends Bloc<CheckupEvent, CheckupState> {
  CheckupBloc();

  @override
  CheckupState get initialState => CheckupStateNotCreated();

  @override
  Stream<CheckupState> mapEventToState(CheckupEvent event) async* {
    switch (event.runtimeType) {
      case AddCheckup:
        yield* _mapAddCheckupToState(event);
        break;
    }
  }

  Stream<CheckupState> _mapAddCheckupToState(AddCheckup event) async* {
    // Send checkup to API and return its ID
  }
}
