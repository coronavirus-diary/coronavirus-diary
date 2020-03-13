import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'activity.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc();

  @override
  ActivityState get initialState => ActivityNotLoaded();

  @override
  Stream<ActivityState> mapEventToState(ActivityEvent event) async* {
    switch (event.runtimeType) {
      case RetrieveActivity:
        yield ActivityLoading();
        yield* _mapRetrieveActivityToState(event);
        break;
    }
  }

  Stream<ActivityState> _mapRetrieveActivityToState(
      RetrieveActivity event) async* {
    try {
      // TODO: load activity
      yield ActivityLoaded();
    } catch (exception) {
      // Activity loading failed, return an error
      yield ActivityLoadingFailed(exception);
    }
  }
}
