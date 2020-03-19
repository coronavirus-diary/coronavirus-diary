import 'package:equatable/equatable.dart';

import 'package:coronavirus_diary/src/data/models/questions.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class QuestionsStateNotLoaded extends QuestionsState {}

class QuestionsStateLoading extends QuestionsState {}

class QuestionsStateLoaded extends QuestionsState {
  final List<Question> questions;

  const QuestionsStateLoaded(this.questions);

  @override
  List<Object> get props => [questions];
}

class QuestionsStateLoadingFailed extends QuestionsState {
  final Exception exception;

  const QuestionsStateLoadingFailed([this.exception]);

  @override
  String toString() => 'CourseListError { exception: $exception }';
}
