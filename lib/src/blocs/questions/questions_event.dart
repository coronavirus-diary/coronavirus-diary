import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadQuestions extends QuestionsEvent {
  final List<QuestionResponse> responses;

  /// If provided, questions will be pre-populated with the [QuestionResponse]s
  /// in [responses].
  const LoadQuestions({this.responses});
}
