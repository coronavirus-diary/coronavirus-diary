import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];
}

class LoadQuestions extends QuestionsEvent {}
