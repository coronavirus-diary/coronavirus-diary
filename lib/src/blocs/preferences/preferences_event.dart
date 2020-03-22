import 'package:equatable/equatable.dart';

import 'package:covidnearme/src/data/models/preferences.dart';

abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class UpdatePreferences extends PreferencesEvent {
  final Preferences newPreferences;

  const UpdatePreferences(this.newPreferences);

  @override
  List<Object> get props => [newPreferences];
}
