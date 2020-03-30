import 'package:json_annotation/json_annotation.dart';

part 'symptom_report.g.dart';

@JsonSerializable(explicitToJson: true)
class SymptomReport {
  String userId;
  UserLocation location;
  List<QuestionResponse> questionResponses;
  bool dataContributionPreference;

  SymptomReport({
    this.userId,
    this.location,
    List<QuestionResponse> questionResponses,
    bool dataContributionPreference,
  })  : dataContributionPreference = dataContributionPreference ?? true,
        questionResponses = questionResponses ?? [];

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
class UserLocation {
  String zipCode;

  /// ISO 3166-1 alpha-2.
  String country;

  UserLocation({
    this.zipCode,
    this.country,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationToJson(this);
}
