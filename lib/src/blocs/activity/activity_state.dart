import 'package:equatable/equatable.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityNotLoaded extends ActivityState {}

class ActivityLoading extends ActivityState {}

class ActivityLoaded extends ActivityState {}

class ActivityLoadingFailed extends ActivityState {
  final Exception exception;

  const ActivityLoadingFailed([this.exception]);
}
