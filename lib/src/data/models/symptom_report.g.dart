// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomReport _$SymptomReportFromJson(Map<String, dynamic> json) {
  return SymptomReport(
    userId: json['user_id'] as String,
    location: json['location'] == null
        ? null
        : UserLocation.fromJson(json['location'] as Map<String, dynamic>),
    questionResponses: (json['question_responses'] as List)
        ?.map((e) => e == null
            ? null
            : QuestionResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dataContributionPreference: json['data_contribution_preference'] as bool,
  );
}

Map<String, dynamic> _$SymptomReportToJson(SymptomReport instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'location': instance.location?.toJson(),
      'question_responses':
          instance.questionResponses?.map((e) => e?.toJson())?.toList(),
      'data_contribution_preference': instance.dataContributionPreference,
    };

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) {
  return QuestionResponse(
    questionId: json['question_id'] as String,
    response: json['response'],
  );
}

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'response': instance.response,
    };

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) {
  return UserLocation(
    zipCode: json['zip_code'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$UserLocationToJson(UserLocation instance) =>
    <String, dynamic>{
      'zip_code': instance.zipCode,
      'country': instance.country,
    };
