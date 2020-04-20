import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/data/models/locations.dart';
import 'package:covidnearme/src/data/repositories/local_statistics.dart';
import 'local_statistics.dart';

export 'package:covidnearme/src/data/repositories/local_statistics.dart';
export 'package:covidnearme/src/data/models/local_statistics.dart';
export 'package:covidnearme/src/data/models/locations.dart';

class LocalStatisticsBloc
    extends Bloc<LocalStatisticsEvent, LocalStatisticsState> {
  final PreferencesState preferencesState;
  final LocalStatisticsRepository localStatisticsRepository;
  final BuildContext context;

  LocalStatisticsBloc({
    @required this.preferencesState,
    @required this.localStatisticsRepository,
    @required this.context,
  });

  @override
  LocalStatisticsState get initialState => const LocalStatisticsNotLoaded();

  @override
  Stream<LocalStatisticsState> mapEventToState(
      LocalStatisticsEvent event) async* {
    switch (event.runtimeType) {
      case GetLocalStatistics:
        yield* _mapGetLocalStatisticsToState(event);
        break;
    }
  }

  Stream<LocalStatisticsState> _mapGetLocalStatisticsToState(
      GetLocalStatistics event) async* {
    yield const LocalStatisticsLoading();

    // Fetch local statistics
    LocalStatisticsResponse localStatisticsResponse =
        await localStatisticsRepository.getLocalStatistics(
            location: event.location);

    // Handle error
    if (localStatisticsResponse.error != null) {
      yield LocalStatisticsError(
        localStatisticsResponse: localStatisticsResponse,
        location: event.location,
      );
      return;
    }

    // Add location to recents
    _addNewRecentLocation(
      localStatisticsResponse.localStatisticsEntries[0].name,
      event.location,
    );

    yield LocalStatisticsLoaded(
      localStatisticsResponse: localStatisticsResponse,
    );
  }

  _addNewRecentLocation(String newLocationName, Location newLocation) {
    List<LocalStatisticsLocation> recentLocalStatisticsLocations =
        preferencesState.preferences.recentLocalStatisticsLocations;
    final newLocalStatisticsLocation = LocalStatisticsLocation(
      name: newLocationName,
      location: newLocation,
    );

    // Remove duplicates
    recentLocalStatisticsLocations.remove((LocalStatisticsLocation location) =>
        location == newLocalStatisticsLocation);

    // Add new location to recents
    recentLocalStatisticsLocations.insert(0, newLocalStatisticsLocation);

    // Reduce recents length to 5
    while (recentLocalStatisticsLocations.length > 5) {
      recentLocalStatisticsLocations.removeLast();
    }

    // Notify app of update
    Preferences newPreferences = preferencesState.preferences.cloneWith(
      recentLocalStatisticsLocations: recentLocalStatisticsLocations,
    );
    context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));
  }
}
