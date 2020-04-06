// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomReport _$SymptomReportFromJson(Map<String, dynamic> json) {
  return SymptomReport(
    userId: json['user_id'] as String,
    isFake: json['is_fake'] as bool,
    location: json['location'] == null
        ? null
        : UserLocation.fromJson(json['location'] as Map<String, dynamic>),
    questionResponses: (json['question_responses'] as List)
        ?.map((e) => e == null
            ? null
            : QuestionResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SymptomReportToJson(SymptomReport instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'is_fake': instance.isFake,
      'location': instance.location?.toJson(),
      'question_responses':
          instance.questionResponses?.map((e) => e?.toJson())?.toList(),
    };

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) {
  return QuestionResponse(
    questionIdentifier: json['question_identifier'] as String,
    response: json['response'] as String,
  );
}

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'question_identifier': instance.questionIdentifier,
      'response': instance.response,
    };

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) {
  return UserLocation(
    country: json['country'] as String,
    postalCode: json['postal_code'] as String,
  );
}

Map<String, dynamic> _$UserLocationToJson(UserLocation instance) =>
    <String, dynamic>{
      'country': instance.country,
      'postal_code': instance.postalCode,
    };
