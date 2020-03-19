import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadQuestions extends QuestionsEvent {}
