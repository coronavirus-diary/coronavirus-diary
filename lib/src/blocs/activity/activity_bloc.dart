import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/data/models/event.dart';

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
      List<Event> events = [
        LocationEvent(
          latitude: -46.24871,
          longitude: 179.21619,
        ),
        LocationEvent(
          latitude: -66.88730,
          longitude: -12.83285,
        ),
        LocationEvent(
          latitude: -1.41970,
          longitude: -64.41213,
        ),
        LocationEvent(
          latitude: -63.22624,
          longitude: -19.26504,
        ),
      ];
      yield ActivityLoaded(events: events);
    } catch (exception) {
      // Activity loading failed, return an error
      yield ActivityLoadingFailed(exception: exception);
    }
  }
}
