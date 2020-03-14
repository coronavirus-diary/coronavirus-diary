import 'package:equatable/equatable.dart';

import 'package:coronavirus_diary/src/data/models/event.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityNotLoaded extends ActivityState {}

class ActivityLoading extends ActivityState {}

class ActivityLoaded extends ActivityState {
  final List<Event> events;

  const ActivityLoaded({this.events});
}

class ActivityLoadingFailed extends ActivityState {
  final Exception exception;

  const ActivityLoadingFailed({this.exception});
}
