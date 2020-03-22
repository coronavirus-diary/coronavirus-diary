import 'package:covidnearme/src/data/models/preferences.dart';

class PreferencesState {
  final Preferences preferences;

  const PreferencesState({this.preferences});

  @override
  String toString() => 'PreferencesState { preferences: $preferences }';
}
