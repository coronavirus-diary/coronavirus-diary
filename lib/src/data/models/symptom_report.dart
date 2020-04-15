import 'package:json_annotation/json_annotation.dart';

import 'package:covidnearme/src/data/models/locations.dart';

part 'symptom_report.g.dart';

@JsonSerializable(explicitToJson: true)
class SymptomReport {
  String userId;
  bool isFake;
  Location location;
  List<QuestionResponse> questionResponses;

  SymptomReport({
    this.userId,
    this.isFake = false,
    this.location,
    List<QuestionResponse> questionResponses,
  }) : questionResponses = questionResponses ?? [];

  factory SymptomReport.fromJson(Map<String, dynamic> json) =>
      _$SymptomReportFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomReportToJson(this);
}

@JsonSerializable()
class QuestionResponse {
  String questionIdentifier;
  String response;

  QuestionResponse({
    this.questionIdentifier,
    this.response,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}
