import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:moor/moor.dart' as moor;

import 'package:coronavirus_diary/src/blocs/activity/activity.dart';
import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/data/database/database.dart';

void initGeofencing(
    PreferencesState preferencesState, ActivityBloc activityBloc) {
  // Disable location if user opted out
  if (!preferencesState.preferences.trackLocation) {
    bg.BackgroundGeolocation.stop();
    return;
  }

  bg.BackgroundGeolocation.onLocation((bg.Location location) {
    activityBloc.add(
      AddActivity(
        locationEntry: LocationsCompanion(
          lat: moor.Value(location.coords.latitude),
          long: moor.Value(location.coords.longitude),
          accuracy: moor.Value(location.coords.accuracy),
          altitude: moor.Value(location.coords.altitude),
        ),
        activityEntry: ActivitiesCompanion(),
      ),
    );
  });

  bg.BackgroundGeolocation.ready(bg.Config(
    desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
    distanceFilter: 100.0,
    stopOnTerminate: false,
    startOnBoot: true,
    debug: true,
    logLevel: bg.Config.LOG_LEVEL_INFO,
  )).then((bg.State state) {
    if (!state.enabled) {
      bg.BackgroundGeolocation.start();
    }
  });
}
