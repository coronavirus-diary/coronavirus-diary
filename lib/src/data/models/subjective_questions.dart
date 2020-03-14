import 'package:json_annotation/json_annotation.dart';

part 'subjective_questions.g.dart';

@JsonSerializable()
class SubjectiveQuestions {
  const SubjectiveQuestions();

  factory SubjectiveQuestions.fromJson(Map<String, dynamic> json) =>
      _$SubjectiveQuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectiveQuestionsToJson(this);
}
