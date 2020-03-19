import 'package:equatable/equatable.dart';

import 'package:coronavirus_diary/src/data/models/checkups.dart';

abstract class CheckupEvent extends Equatable {
  const CheckupEvent();

  @override
  List<Object> get props => [];
}

class StartCheckup extends CheckupEvent {}

class UpdateLocalCheckup extends CheckupEvent {
  final Checkup updatedCheckup;

  const UpdateLocalCheckup({this.updatedCheckup});

  @override
  List<Object> get props => [updatedCheckup];

  @override
  String toString() => 'UpdateLocalCheckup { updatedCheckup: $updatedCheckup }';
}

class UpdateRemoteCheckup extends CheckupEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'UpdateRemoteCheckup';
}

class CompleteCheckup extends CheckupEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'CompleteCheckup';
}
