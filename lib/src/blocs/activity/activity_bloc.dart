import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/data/database/database.dart';

import 'activity.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityHistoryState> {
  final AppDatabase database = AppDatabase();

  ActivityBloc();

  @override
  ActivityHistoryState get initialState => ActivityHistoryNotLoaded();

  @override
  Stream<ActivityHistoryState> mapEventToState(ActivityEvent event) async* {
    switch (event.runtimeType) {
      case RetrieveActivity:
        yield ActivityHistoryLoading();
        yield* _mapRetrieveActivityToState(event);
        break;
    }
  }

  Stream<ActivityHistoryState> _mapRetrieveActivityToState(
      RetrieveActivity event) async* {
    try {
      List<ActivityWithLocation> activities = await database.allActivities();
      yield ActivityHistoryLoaded(activities: activities);
    } catch (exception) {
      // Activity loading failed, return an error
      yield ActivityHistoryLoadingFailed(exception: exception);
    }
  }
}
