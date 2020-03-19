import 'package:equatable/equatable.dart';

import 'package:coronavirus_diary/src/data/models/checkups.dart';

abstract class CheckupState extends Equatable {
  const CheckupState();

  @override
  List<Object> get props => [];
}

class CheckupStateNotCreated extends CheckupState {}

class CheckupStateInProgress extends CheckupState {
  final Checkup checkup;

  const CheckupStateInProgress({this.checkup});

  @override
  List<Object> get props => [checkup];

  @override
  String toString() => 'CheckupStateInProgress { checkup: $checkup }';
}

class CheckupStateCompleted extends CheckupState {}
