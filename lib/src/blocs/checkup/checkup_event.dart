import 'package:equatable/equatable.dart';

import 'package:coronavirus_diary/src/data/models/checkups.dart';

abstract class CheckupEvent extends Equatable {
  const CheckupEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class StartCheckup extends CheckupEvent {}

class UpdateLocalCheckup extends CheckupEvent {
  final Checkup updatedCheckup;

  const UpdateLocalCheckup({this.updatedCheckup});

  @override
  List<Object> get props => [updatedCheckup];
}

class UpdateRemoteCheckup extends CheckupEvent {}

class CompleteCheckup extends CheckupEvent {}
