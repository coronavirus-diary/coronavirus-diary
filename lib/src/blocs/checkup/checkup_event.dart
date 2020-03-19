import 'package:equatable/equatable.dart';

abstract class CheckupEvent extends Equatable {
  const CheckupEvent();

  @override
  List<Object> get props => [];
}

class AddCheckup extends CheckupEvent {}
