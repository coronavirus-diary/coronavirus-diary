import 'package:coronavirus_diary/src/data/database/database.dart';
import 'package:equatable/equatable.dart';

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
