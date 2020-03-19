import 'package:equatable/equatable.dart';

import 'package:coronavirus_diary/src/data/models/checkups.dart';

abstract class CheckupState extends Equatable {
  const CheckupState();

  @override
  List<Object> get props => [];
}

class CheckupStateNotCreated extends CheckupState {}

class CheckupStateCreated extends CheckupState {
  final Checkup checkup;

  const CheckupStateCreated(this.checkup);

  @override
  List<Object> get props => [checkup];
}
