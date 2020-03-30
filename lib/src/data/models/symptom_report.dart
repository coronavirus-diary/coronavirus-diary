import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'symptom_report.g.dart';

@JsonSerializable(explicitToJson: true)
class SymptomReport {
  String userId;
  SymptomReportLocation location;
  List<QuestionResponse> questionResponses;
  bool dataContributionPreference;

  SymptomReport({
    this.userId,
    this.location,
    this.questionResponses,
    this.dataContributionPreference
  });

  factory SymptomReport.fromJson(Map<String, dynamic> json) =>
      _$SymptomReportFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomReportToJson(this);
}

@JsonSerializable()
class QuestionResponse {
  String questionId;
  dynamic response;

  QuestionResponse({
    this.questionId,
    this.response,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}

@JsonSerializable()
class SymptomReportLocation {
  String zipCode;
  /// ISO 3166-1 alpha-2.
  String country;

  SymptomReportLocation({
    this.zipCode,
    this.country,
  });

  factory SymptomReportLocation.fromJson(Map<String, dynamic> json) =>
      _$SymptomReportLocationFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomReportLocationToJson(this);
}