import 'package:json_annotation/json_annotation.dart';

part 'checkups.g.dart';

@JsonSerializable()
class Checkup {
  final String id;
  final DateTime created;
  final List<SubjectiveQuestionResponse> subjectiveResponses;
  final List<VitalsResponse> vitalsResponses;

  const Checkup({
    this.id,
    this.created,
    this.subjectiveResponses,
    this.vitalsResponses,
  });

  factory Checkup.fromJson(Map<String, dynamic> json) =>
      _$CheckupFromJson(json);
  Map<String, dynamic> toJson() => _$CheckupToJson(this);
}

@JsonSerializable()
class SubjectiveQuestionResponse {
  final String id;
  final String response;

  const SubjectiveQuestionResponse({
    this.id,
    this.response,
  });

  factory SubjectiveQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectiveQuestionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectiveQuestionResponseToJson(this);
}

@JsonSerializable()
class VitalsResponse {
  final String id;
  final String response;
  final String dataSource;

  const VitalsResponse({
    this.id,
    this.response,
    this.dataSource,
  });

  factory VitalsResponse.fromJson(Map<String, dynamic> json) =>
      _$VitalsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VitalsResponseToJson(this);
}
