import 'package:equatable/equatable.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class RetrieveActivity extends ActivityEvent {}
