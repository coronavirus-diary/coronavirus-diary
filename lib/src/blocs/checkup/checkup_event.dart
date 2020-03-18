import 'package:coronavirus_diary/src/data/database/database.dart';
import 'package:equatable/equatable.dart';

abstract class CheckupEvent extends Equatable {
  const CheckupEvent();

  @override
  List<Object> get props => [];
}

class AddCheckup extends CheckupEvent {}
