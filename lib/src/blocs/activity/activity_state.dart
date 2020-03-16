import 'package:equatable/equatable.dart';

import 'package:coronavirus_diary/src/data/database/database.dart';

abstract class ActivityHistoryState extends Equatable {
  const ActivityHistoryState();

  @override
  List<Object> get props => [];
}

class ActivityHistoryNotLoaded extends ActivityHistoryState {}

class ActivityHistoryLoading extends ActivityHistoryState {}

class ActivityHistoryLoaded extends ActivityHistoryState {
  final List<ActivityWithLocation> activities;

  const ActivityHistoryLoaded({this.activities});
}

class ActivityHistoryLoadingFailed extends ActivityHistoryState {
  final Exception exception;

  const ActivityHistoryLoadingFailed({this.exception});
}
