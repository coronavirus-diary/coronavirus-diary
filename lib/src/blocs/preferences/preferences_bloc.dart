import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:covidnearme/src/data/models/preferences.dart';
import 'preferences.dart';

export 'package:covidnearme/src/data/models/preferences.dart';

class PreferencesBloc extends HydratedBloc<PreferencesEvent, PreferencesState> {
  // Use previously cached initialState if it's available
  @override
  PreferencesState get initialState {
    return super.initialState ?? PreferencesState(preferences: Preferences());
  }

  // Called when trying to read cached state from storage.
  // Be sure to handle any exceptions that can occur and return null
  // to indicate that there is no cached data.
  @override
  PreferencesState fromJson(Map<String, dynamic> source) {
    try {
      return PreferencesState(preferences: Preferences.fromJson(source));
    } catch (_) {
      return null;
    }
  }

  // Called on each state change (transition)
  // If it returns null, then no cache updates will occur.
  // Otherwise, the returned value will be cached.
  @override
  Map<String, dynamic> toJson(PreferencesState state) {
    try {
      return state.preferences.toJson();
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<PreferencesState> mapEventToState(PreferencesEvent event) async* {
    switch (event.runtimeType) {
      case UpdatePreferences:
        yield* _mapUpdatePreferencesToState(event);
        break;
    }
  }

  Stream<PreferencesState> _mapUpdatePreferencesToState(
      UpdatePreferences event) async* {
    yield PreferencesState(
      preferences: event.newPreferences,
    );
  }
}
