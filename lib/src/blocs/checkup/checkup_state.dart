import 'package:covidnearme/src/data/models/assessments.dart';
import 'package:covidnearme/src/data/models/checkups.dart';

abstract class CheckupState {
  const CheckupState();
}

class CheckupStateNotCreated extends CheckupState {
  const CheckupStateNotCreated();
}

class CheckupStateCreating extends CheckupState {
  const CheckupStateCreating();
}

class CheckupStateInProgress extends CheckupState {
  final Checkup checkup;

  const CheckupStateInProgress({this.checkup});

  @override
  String toString() => 'CheckupStateInProgress { checkup: $checkup }';
}

class CheckupStateCompleting extends CheckupState {
  const CheckupStateCompleting();
}

class CheckupStateCompleted extends CheckupState {
  final Assessment assessment;

  const CheckupStateCompleted({this.assessment});

  @override
  String toString() => 'CheckupStateCompleted { assessment: $assessment }';
}
