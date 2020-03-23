import 'package:equatable/equatable.dart';

import 'package:covidnearme/src/data/models/checkups.dart';

abstract class CheckupEvent extends Equatable {
  const CheckupEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class StartCheckup extends CheckupEvent {
  const StartCheckup();
}

class UpdateCheckup extends CheckupEvent {
  final Checkup updatedCheckup;

  const UpdateCheckup({this.updatedCheckup});

  @override
  List<Object> get props => [updatedCheckup];
}

class CompleteCheckup extends CheckupEvent {
  const CompleteCheckup();
}
