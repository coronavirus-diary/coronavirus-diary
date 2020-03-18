import 'package:equatable/equatable.dart';

import 'package:coronavirus_diary/src/data/database/database.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class RetrieveActivity extends ActivityEvent {}

class AddActivity extends ActivityEvent {
  final LocationsCompanion locationEntry;
  final ActivitiesCompanion activityEntry;

  const AddActivity({this.locationEntry, this.activityEntry});

  @override
  List<Object> get props => [locationEntry, activityEntry];
}
