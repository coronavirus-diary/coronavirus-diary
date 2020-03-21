import 'package:coronavirus_diary/src/data/models/assessments.dart';
import 'package:coronavirus_diary/src/data/models/checkups.dart';

abstract class CheckupState {
  const CheckupState();
}

class CheckupStateNotCreated extends CheckupState {}

class CheckupStateCreating extends CheckupState {}

class CheckupStateInProgress extends CheckupState {
  final Checkup checkup;

  const CheckupStateInProgress({this.checkup});

  @override
  String toString() => 'CheckupStateInProgress { checkup: $checkup }';
}

class CheckupStateCompleting extends CheckupState {}

class CheckupStateCompleted extends CheckupState {
  final Assessment assessment;

  const CheckupStateCompleted({this.assessment});

  @override
  String toString() => 'CheckupStateCompleted { assessment: $assessment }';
}
