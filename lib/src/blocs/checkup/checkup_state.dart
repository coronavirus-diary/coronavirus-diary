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

class CheckupStateCompleted extends CheckupState {}
